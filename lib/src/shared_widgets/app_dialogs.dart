import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/presentation/controller/payment_controller/payment_coupon_controller.dart';
import 'package:ahtizam/src/shared_widgets/custom_button_widget.dart';

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
              children: [
                icon ?? SizedBox(),
                28.verticalSpace,
                title
                // Text(
                //   title,
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context)
                //       .textTheme
                //       .displayLarge!
                //       .copyWith(fontSize: 22),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showAcceptCancelOrder(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.white.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                40.verticalSpace,

                Text(
                  "cancel_order_msg".tr(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey,
                      ),
                ),

                40.verticalSpace,

                Text(
                  "cancel_order_dsc".tr(),
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
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        backgroundColor: AppColors.black,
                        isFiled: true,
                        height: 52,
                        radius: 12,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                    20.horizontalSpace,
                    Flexible(
                      child: CustomButtonWidget(
                        text: context.tr("no"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.black,
                        isFiled: false,
                        borderColor: AppColors.darkGray,
                        height: 52,
                        radius: 12,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                  ],
                )
              ],
            ).allPadding(20),
          ));
    },
  );
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
                _truckRow(context),
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

_truckRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Assets.icons.truck.svg(),
      Text(
        "سطحة",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ],
  ).onlyPadding(bottom: 16);
}

Widget _infoRow(BuildContext context, String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(value, style: Theme.of(context).textTheme.bodyMedium),
      Text(label, style: Theme.of(context).textTheme.bodyMedium),
    ],
  ).symmetricPadding(vertical: 16);
}

Future<void> showSearchingTruckLoading({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useSafeArea: false,
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
  TextEditingController couponController = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          final paymentState =
              ref.watch(paymentCouponControllerProvider(totalCost));
          final paymentController =
              ref.read(paymentCouponControllerProvider(totalCost).notifier);

          return GestureDetector(
            onTap: () {
              FocusScope.of(context)
                  .requestFocus(FocusNode()); // Dismiss keyboard
            },
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.white.withOpacity(0.8),
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
                            if (paymentState
                                .isCouponApplied) // Show original price if discount applied
                              Text(
                                "with_currency".tr(
                                    args: [paymentState.totalCost.toString()]),
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
                                paymentState.discountedCost.toString()
                              ]),

                              // "${paymentState.discountedCost} ر.ق",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: paymentState.isCouponApplied
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
                              "$duration - $distance كم",
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
                        Row(
                          children: [
                            // Coupon Input Field
                            Flexible(
                              flex: 4,
                              child: SizedBox(
                                height: 54,
                                child: TextFormField(
                                  controller: couponController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: paymentState.isCouponApplied
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
                                          color: paymentState.isCouponApplied
                                              ? AppColors.primary
                                              : AppColors.lightestGray,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                          color: paymentState.isCouponApplied
                                              ? AppColors.primary
                                              : AppColors.lightestGray,
                                          width: 1.5),
                                    ),

                                    // ✅ Border when the field is focused (user clicked inside)
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                          color: paymentState.isCouponApplied
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
                                text: paymentState.isCouponApplied
                                    ? context.tr("cancel")
                                    : context.tr("active"),
                                onTap: () {
                                  if (paymentState.isCouponApplied) {
                                    // Reset coupon
                                    paymentController.removeCoupon();
                                    couponController.clear();
                                  } else {
                                    // Apply discount logic
                                    if (couponController.text.isNotEmpty) {
                                      paymentController
                                          .applyCoupon(couponController.text);
                                    }
                                  }
                                },
                                backgroundColor: AppColors.primary,
                                color: AppColors.black,
                                isFiled: true,
                                height: 52,
                                radius: 12,
                                width: 100,
                              ).onlyPadding(bottom: 0),
                            ),
                          ],
                        ),

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
