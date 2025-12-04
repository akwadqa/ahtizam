import 'dart:async';
import 'dart:ui';

import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:ahtizam/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:ahtizam/src/features/wallet/presentation/controller/wallet_controller.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/payment_controller/payment_coupon_controller.dart';
import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../gen/assets.gen.dart';
import '../features/payment/presentation/widgets/success_payment.dart';
import '../theme/app_colors.dart';
import 'searching_truck_loading.dart';

Future<bool?> showCustomDialog({
  required BuildContext context,
  required Widget title,
  Widget? icon,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300, // Replace with appropriate fixed or dynamic size
            maxHeight: 400,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [icon ?? SizedBox(), 28.verticalSpace, title],
            ),
          ),
        ),
      );
    },
  );
}

Dialog showYesNowChoicesDialog(
  BuildContext context, {
  required String title,
  required String dsc,
  required VoidCallback yesButton,
  VoidCallback? noButton,
}) {
  return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white.withOpacity(0.99),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.verticalSpace,

          Text(
            title.tr(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey,
                ),
          ).centered(),

          40.verticalSpace,

          Text(
            dsc.tr(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14,
                color: AppColors.darkerGray,
                fontWeight: FontWeight.w500),
          ),

          40.verticalSpace,

          // **Pay Button**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomButtonWidget(
                  text: context.tr("yes"),
                  onTap: yesButton,
                  backgroundColor: AppColors.black,
                  isFiled: true,
                  height: 45,
                  radius: 12,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
              20.horizontalSpace,
              Flexible(
                child: CustomButtonWidget(
                  text: context.tr("no"),
                  onTap: noButton ??
                      () {
                        Navigator.pop(context);
                      },
                  color: AppColors.black,
                  isFiled: false,
                  borderColor: AppColors.darkGray,
                  height: 45,
                  radius: 12,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
            ],
          )
        ],
      ).symmetricPadding(horizontal: 20, vertical: 25));
}

Future<void> showRateDriverDialog(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(builder: (context, ref, widget) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.verticalSpace,

                    Assets.images.checkDoneImage.image(width: 150, height: 100),
                    20.verticalSpace,
                    Text(
                      "trip_is_over".tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey,
                          ),
                    ),

                    20.verticalSpace,
                    // **Pay Button**
                    CustomButtonWidget(
                      text: context.tr("rate_drive"),
                      onTap: () async {
                        Navigator.pop(context);
                        // await Future.delayed(Duration(milliseconds: 1000));
                        context.pushRoute(RateRoute());
                      },
                      backgroundColor: AppColors.black,
                      isFiled: true,
                      height: 45,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ],
                ).symmetricPadding(horizontal: 20, vertical: 15),
                PositionedDirectional(
                  start: 15,
                  top: 15,
                  child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 22,
                      ),
                      splashColor: AppColors.black,
                      padding: EdgeInsets.zero,
                      alignment: AlignmentDirectional.topStart,
                      onPressed: () {
                        ref.read(mapControllerProvider.notifier)
                          ..resetPoints()
                          ..updateLocation();
                        ref
                            .read(quickOrderControllerProvider.notifier)
                            .resetOrderDetails();
      ref.read(priceOfferControllerProvider.notifier).resetOrderDetails();

                        Navigator.pop(context);
                      }),
                ),
              ],
            ));
      });
    },
  );
}

Future<void> showAcceptCancelOrder(
  BuildContext context,
  WidgetRef ref,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return showYesNowChoicesDialog(context,
            title: "cancel_order_msg",
            dsc: "cancel_order_dsc", yesButton: () async {
          final result = await ref
              .read(quickOrderControllerProvider.notifier)
              .cancelOrder(context: context);
          //  if(result){
          //   Navigator.pop(context);

          //   // Navigator.pop(context);
          //  }
          //   // await Future.delayed(Duration(milliseconds: 1000));
          //   // Navigator.pop(context);
        });
      });
}

void showLogoutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final userData = ref.read(userDataProvider.notifier);
            return Container(
              child: showYesNowChoicesDialog(
                context,
                title: "logout".tr(),
                dsc: "logout_confirmation".tr(),
                yesButton: () async {
                  Navigator.pop(context);
                  await userData.removeData();
                  context.router.replaceAll([const LoginRoute()]);

                  // Navigator.pop(context);
                },
              ),
            );
          },
        );
      });
}
void showDeleteAccountDialog(BuildContext context,WidgetRef ref) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final userData = ref.read(userDataProvider.notifier);
            final profileState=ref.watch(profileControllerProvider);
            return 
            
            Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white.withOpacity(0.99),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.verticalSpace,

          Text(
            "delete_account".tr(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey,
                ),
          ).centered(),

          40.verticalSpace,

          Text(
            "delete_account_confirmation".tr(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14,
                color: AppColors.darkerGray,
                fontWeight: FontWeight.w500),
          ),

          40.verticalSpace,

          // **Pay Button**
(profileState.isLoading)?Center(child: FadeCircleLoadingIndicator()):
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomButtonWidget(
                  text: context.tr("yes"),
                  onTap: ()async{
                     final success = await ref
                  .read(profileControllerProvider.notifier)
                  .deleteAccount();

              if (success) {
                Navigator.pop(context);
                await userData.removeData();
                context.router.replaceAll([const LoginRoute()]);
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("")),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(

                  SnackBar(backgroundColor: AppColors.darkRed, content: Text("account_deactivated_success".tr())),
                );
              }
                  },
                  backgroundColor: AppColors.black,
                  isFiled: true,
                  height: 45,
                  radius: 12,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
              20.horizontalSpace,
              Flexible(
                child: CustomButtonWidget(
                  text: context.tr("no"),
                  onTap: 
                      () {
                        Navigator.pop(context);
                      },
                  color: AppColors.black,
                  isFiled: false,
                  borderColor: AppColors.darkGray,
                  height: 45,
                  radius: 12,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
            ],
          )
        ],
      ).symmetricPadding(horizontal: 20, vertical: 25));

            
            // Stack(
            //   children: [
            //     Container(
            //       child: showYesNowChoicesDialog(
            //         context,
            //         title: "delete_account".tr(),
            //         dsc: "delete_account_msg".tr(),
            //         yesButton: () async {
                
            //           final delete=await ref.read(profileControllerProvider.notifier).deleteAccount();   
            //           if(delete) {             
            //           Navigator.pop(context);
            //           await userData.removeData();
            //           context.router.replaceAll([const LoginRoute()]);
            //     }
            //           // Navigator.pop(context);
            //         },
            //       ),
            //     ),

            //   ],
            // );
          },
        );
      });
}
Future<void> showUpdateDialog(
  BuildContext context,
  String title,
  String message,
  String? url,
  bool isRequired,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      final theme = Theme.of(context);

      return PopScope(
        canPop:!isRequired,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            message.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
              Row(
                children: [
            if (!isRequired)

                  Expanded(
                    child: CustomButtonWidget(
                      text: 'later'.tr(),
                      backgroundColor: Colors.transparent,
                      color: AppColors.black900,
                      isFiled: false,
                      height: 45,
                      radius: 10,
                      width: double.infinity,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ),
                              const SizedBox(width: 12),
                              Expanded(
                  child: CustomButtonWidget(
                    text: 'update'.tr(),
                    backgroundColor: AppColors.primary,
                    color: AppColors.offWhite,
                    isFiled: true,
                    height: 45,
                    width: double.infinity/2,
                    radius: 10,
                    onTap: () async {
                      if (url == null) return;
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(tr('could_not_open_link'))),
                          );
                        }
                      }
                    },
                  ),
                              ),
                ],
              ),
          ],
        ),
      );
    },
  );
}

Future<void> showAutoClosingDialog(BuildContext context, String message,
    {Widget? icon}) async {
  Timer timer;

  // Start timer to auto-close the dialog
  timer = Timer(Duration(seconds: 3), () {
    Navigator.of(context).pop();
  });

  await showDialog(
    context: context,
    barrierDismissible: true, // User can still tap outside to close
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              // fontWeight: FontWeight.w700,
              // color: Colors.grey,
            ),
      ).centered(),
      icon: icon ??
          Icon(
            Icons.error,
            color: AppColors.darkRed,
            size: 50,
          ),
      actions: [
        TextButton(
          onPressed: () {
            if (timer.isActive) timer.cancel();
            Navigator.of(context).pop(); // User manually closes
          },
          child: Text(
            "OK",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ).centered(),
        ),
      ],
    ),
  ).then((val) {
    if (timer.isActive) {
      timer.cancel();
    }
  });
}

Future<bool?> showErrorDialog(BuildContext context, String message) {
  return showCustomDialog(
    context: context,
    title: Text(message),
    icon: Icon(
      Icons.error,
      color: AppColors.darkRed,
      size: 50,
    ),
  );
}

Future<void> showTruckDetailsDialog({
  required BuildContext context,
  required String weight,
  required String serviceTypeName,
  required String scales,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 320,
            maxHeight: 350,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                  ),
                  splashColor: AppColors.lightGray,
                  padding: EdgeInsets.zero,
                  alignment: AlignmentDirectional.topStart,
                  onPressed: () => Navigator.pop(context),
                ),
                _truckRow(context, serviceTypeName),
                8.verticalSpace,
                _customeDivider(),
                _infoRow(context, "vehicle_capacity".tr(), "$weight kg"),
                _customeDivider(),
                _infoRow(context, "vehicle_size".tr(), scales),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Divider _customeDivider() => Divider(
      color: AppColors.lightGray,
      height: 1,
    );

Widget _truckRow(BuildContext context, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Assets.icons.truck.svg(),
    ],
  ).onlyPadding(bottom: 16);
}

Widget _infoRow(BuildContext context, String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: Theme.of(context).textTheme.bodyMedium),
      Text(value, style: Theme.of(context).textTheme.bodyMedium),
    ],
  ).symmetricPadding(vertical: 16);
}

Future<void> showSearchingTruckLoading({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useSafeArea: false,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SearchingTruckLoading();
    },
  );
}

void showCustomConnectingToDriverDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FadeCircleLoadingIndicator(),
            const SizedBox(height: 16),
            Text("connecting_to_driver".tr(),
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    ),
  );
}

Future<void> showSuccessPayment({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (BuildContext context) {
      return SuccessPayment();
    },
  );
}

Future<void> showPaymentDialog(
  BuildContext context, {
  required double totalCost,
  required String distance,
  required String duration,
}) {
  String couponValue = '';
  final couponController = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          final paymentState = ref.watch(paymentCouponControllerProvider);
          // final orderState =
          //     ref.watch(quickOrderControllerProvider);
          final paymentController =
              ref.read(paymentCouponControllerProvider.notifier);
          final paymentStateValue = paymentState.value;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context)
                  .requestFocus(FocusNode()); // Dismiss keyboard
            },
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.white.withOpacity(0.98),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // **Title**
                        Text(
                          "final_cost".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        10.verticalSpace,

                        // **Total Cost with Discount**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (paymentStateValue!.isCouponApplied &&
                                paymentStateValue.discountedCost !=
                                    null) // Show original price if discount applied
                              Text(
                                "with_currency".tr(args: [
                                  paymentStateValue.baseCost
                                          ?.toStringAsFixed(2) ??
                                      ""
                                ]),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      // color: Colors.grey,
                                    ),
                              ),
                            6.horizontalSpace,
                            Text(
                              "with_currency".tr(args: [
                                paymentStateValue.totalCost.toStringAsFixed(2)
                              ]),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: paymentStateValue.isCouponApplied &&
                                            paymentStateValue.discountedCost !=
                                                null
                                        ? Colors.orange
                                        : Colors.black,
                                  ),
                            ),
                          ],
                        ),

                        40.verticalSpace,

                        // **Distance & Duration**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "duration_and_distance".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              // paymentState.value,
                              "$duration - $distance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 14,
                                      color: AppColors.darkerGray,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        30.verticalSpace,

                        // **Coupon Code Input**
                        StatefulBuilder(builder: (context, setState) {
                          return Row(
                            children: [
                              // Coupon Input Field
                              Flexible(
                                flex: 4,
                                child: SizedBox(
                                  height: 54,
                                  child: TextFormField(
                                    controller: couponController,
                                    onChanged: (value) {
                                      setState(() {
                                        couponValue = value;
                                      });
                                    },
                                    validator: qValidator([
                                      IsRequired(context.tr('required')),
                                      // IsEmail(context.tr('name_valdation_msg'))
                                    ]),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          paymentStateValue.isCouponApplied &&
                                                  paymentStateValue
                                                          .discountedCost !=
                                                      null
                                              ? AppColors.lightPrimary
                                                  .withOpacity(0.4)
                                              : Colors.white,
                                      focusColor: Colors.white,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Assets.icons.coupon.svg(),
                                      ),
                                      hintText: "enter_coupon_number".tr(),

                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                              fontSize: 11,
                                              color: AppColors.grey600),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: BorderSide(
                                            color: paymentStateValue
                                                        .isCouponApplied &&
                                                    paymentStateValue
                                                            .discountedCost !=
                                                        null
                                                ? AppColors.primary
                                                : AppColors.lightestGray,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: BorderSide(
                                            color: paymentStateValue
                                                        .isCouponApplied &&
                                                    paymentStateValue
                                                            .discountedCost !=
                                                        null
                                                ? AppColors.primary
                                                : AppColors.lightestGray,
                                            width: 1.5),
                                      ),

                                      // ✅ Border when the field is focused (user clicked inside)
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: BorderSide(
                                            color: paymentStateValue
                                                        .isCouponApplied &&
                                                    paymentStateValue
                                                            .discountedCost !=
                                                        null
                                                ? AppColors.primary
                                                : AppColors.lightestGray,
                                            width: 2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              15.horizontalSpace,

                              // **Activate / Cancel Button**
                              Flexible(
                                flex: 2,
                                child: CustomButtonWidget(
                                  text: paymentStateValue.isCouponApplied
                                      ? context.tr("cancel")
                                      : context.tr("active"),
                                  onTap: couponValue.isEmpty
                                      ? null
                                      : () async {
                                          if (paymentStateValue
                                              .isCouponApplied) {
                                            // Reset coupon
                                            paymentController.removeCoupon();
                                            couponValue = "";
                                            couponController.clear();
                                          } else {
                                            // Apply discount logic
                                            if (couponController
                                                .text.isNotEmpty) {
                                              final result =
                                                  await paymentController
                                                      .applyCoupon(
                                                          couponController.text,
                                                          context);
                                              if (!result) {
                                                debugPrint(
                                                    "not valid coupon code yet");
                                                if (!context.mounted) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "not valid coupon code "
                                                                .tr())),
                                                  );
                                                }
                                              }
                                            }
                                          }
                                        },
                                  backgroundColor: couponValue.isEmpty
                                      ? AppColors.lightestGray
                                      : AppColors.primary,
                                  color: AppColors.black,
                                  isFiled: true,
                                  height: 52,
                                  radius: 12,
                                  width: 100,
                                ).onlyPadding(bottom: 0),
                              ),
                            ],
                          );
                        }),

                        20.verticalSpace,

                        // **Pay Button**
                        CustomButtonWidget(
                          text: context.tr("pay"),
                          onTap: () {
                            context.navigateTo(PaymentMethodRoute());
                          },
                          backgroundColor: AppColors.black,
                          isFiled: true,
                          height: 52,
                          radius: 12,
                          width: MediaQuery.sizeOf(context).width,
                        ).onlyPadding(bottom: 5)
                      ],
                    ),
                  ),
                  PositionedDirectional(
                    start: 15,
                    top: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 22,
                      ),
                      splashColor: AppColors.lightGray,
                      padding: EdgeInsets.zero,
                      alignment: AlignmentDirectional.topStart,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ).allPadding(20),
            ),
          );
        },
      );
    },
  );
}

Future<void> showWithdrawingDialog(
  BuildContext context,
) {
  TextEditingController amountAddedController = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          // final paymentState =
          //     ref.watch(paymentCouponControllerProvider(totalCost));
          // final paymentController =
          //     ref.read(paymentCouponControllerProvider(totalCost).notifier);

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Dialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 12),
                backgroundColor: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // **Title**
                          Text(
                            "enter_amount_need_to_add".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                          ).centered(),

                          20.verticalSpace,
                          SizedBox(
                            height: 54,
                            child: TextFormField(
                              controller: amountAddedController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white,

                                hintText: "enter_amount_number".tr(),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                        fontSize: 11, color: AppColors.grey600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: AppColors.gray, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: AppColors.gray, width: 1),
                                ),

                                // ✅ Border when the field is focused (user clicked inside)
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: AppColors.gray, width: 1),
                                ),
                              ),
                            ),
                          ),

                          10.verticalSpace,

                          // Text(
                          //   "available_amount".tr(args: [availableAmount.toString()]),
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(
                          //           fontSize: 14,
                          //           color: AppColors.dark,
                          //           fontWeight: FontWeight.w500),
                          // ),

                          20.verticalSpace,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: CustomButtonWidget(
                                  text: context.tr("add"),
                                  onTap: () {
                                    ref
                                        .read(walletControllerProvider.notifier)
                                        .processAddStock(
                                            amountAddedController.text,
                                            context);
                                  },
                                  backgroundColor: AppColors.black,
                                  isFiled: true,
                                  height: 50,
                                  radius: 12,
                                  width: MediaQuery.sizeOf(context).width,
                                ),
                              ),
                              20.horizontalSpace,
                              Flexible(
                                child: CustomButtonWidget(
                                  text: context.tr("cancel"),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  color: AppColors.black,
                                  backgroundColor: AppColors.white,
                                  isFiled: false,
                                  borderColor: AppColors.darkGray,
                                  height: 50,
                                  radius: 12,
                                  width: MediaQuery.sizeOf(context).width,
                                ),
                              ),
                            ],
                          ).onlyPadding(bottom: 10),
                        ],
                      ),
                    ),
                  ],
                ).allPadding(20),
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> showSuccessWiwthdrawingDialog({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(
              Icons.check_circle_rounded,
              color: AppColors.primary,
              size: 175,
            ),
            28.verticalSpace,
            Text(
              "the request has been successfully sent",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 22),
            ),
            20.verticalSpace,
            Text(
              "your request is being processed",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16),
            ),
            Spacer(),
            CustomButtonWidget(
              text: context.tr("main screen"),
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: AppColors.black,
              color: AppColors.white,
              isFiled: false,
              borderColor: AppColors.darkGray,
              height: 50,
              radius: 12,
              width: MediaQuery.sizeOf(context).width,
            ).onlyPadding(bottom: 25, start: 16, end: 16),
          ],
        ),
      );
    },
  );
}

Future<void> showWalletRechargeDialog(BuildContext context, String message) async{
 await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('wallet_insufficient_title'.tr()),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.pop(context);
          },
          child: Text('cancel'.tr()),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            showWithdrawingDialog(context); // Your wallet top-up dialog
          },
          child: Text('add_money'.tr()),
        ),
      ],
    ),
  );
}
