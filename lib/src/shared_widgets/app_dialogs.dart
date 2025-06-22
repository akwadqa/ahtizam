import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/payment_controller/payment_coupon_controller.dart';
import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../gen/assets.gen.dart';
import '../features/payment/presentation/widgets/success_payment.dart';
import '../theme/app_colors.dart';
import 'searching_truck_loading.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required Widget title,
  Widget? icon,
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

Future<void> showYesNowChoicesDialog(
  BuildContext context, {
  required String title,
  required String dsc,
  required VoidCallback yesButton,
  VoidCallback? noButton,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
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
    },
  );
}

Future<void> showRateDriverDialog(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.white.withOpacity(0.8),
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ));
    },
  );
}

Future<void> showAcceptCancelOrder(
  BuildContext context,
  WidgetRef ref,
) {
  return showYesNowChoicesDialog(context,
      title: "cancel_order_msg", dsc: "cancel_order_dsc", yesButton: () async {
  ref.read(quickOrderControllerProvider.notifier)
      .resetOrderDetails();
        ref
        .read(hideLayersDuringOrderControllerProvider.notifier)
        .hideLayersDuringOrder();
    ref.read(mapControllerProvider.notifier)
      ..resetPoints()
      ..updateLocation();
    Navigator.pop(context);
    
    // await Future.delayed(Duration(milliseconds: 1000));
    // Navigator.pop(context);
  });
}

void showLogoutDialog(BuildContext context) {
  showYesNowChoicesDialog(context, title: "logout", dsc: "logout_confirmation",
      yesButton: () {
    Navigator.pop(context);
    // Navigator.pop(context);
  });
}

showErrorDialog(BuildContext context, String message) {
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

_customeDivider() => Divider(
      color: AppColors.lightGray,
      height: 1,
    );

_truckRow(BuildContext context, String value) {
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
                                  paymentStateValue.totalCost.toString()
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
                                paymentStateValue.totalCost.toString()
                              ]),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: paymentStateValue.isCouponApplied&&
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
                                          paymentStateValue.isCouponApplied
                                          &&
                                paymentStateValue.discountedCost !=
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
                                                    .isCouponApplied
                                                    &&
                                paymentStateValue.discountedCost !=
                                    null
                                                ? AppColors.primary
                                                : AppColors.lightestGray,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                        borderSide: BorderSide(
                                            color: paymentStateValue
                                                    .isCouponApplied
                                                    &&
                                paymentStateValue.discountedCost !=
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
                                                    .isCouponApplied
                                                    &&
                                paymentStateValue.discountedCost !=
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
                                      : () {
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
                                              paymentController.applyCoupon(
                                                  couponController.text,context);
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
