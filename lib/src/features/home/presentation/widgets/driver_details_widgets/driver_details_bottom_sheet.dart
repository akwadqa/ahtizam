import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared_widgets/custom_button_widget.dart';
import '../../../../../theme/app_colors.dart';

void showDriverDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white.withOpacity(0.9),
    builder: (context) {
      return const DriverDetailsBottomSheet()
          .onlyPadding(bottom: MediaQuery.of(context).viewInsets.bottom);
    },
  );
}

class DriverDetailsBottomSheet extends ConsumerWidget {
  const DriverDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Dismiss keyboard
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // **Truck & Driver Details Row**
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                      padding: EdgeInsets.all(4),
                      width: min(125, 125) / 2,
                      height: min(125, 125) / 2,
                      decoration: BoxDecoration(
                        color: AppColors.darkGray,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: Assets.icons.profile.svg()),
                ),
                16.horizontalSpace,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "سالم",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          4.horizontalSpace,
                          Text(
                            "4.5",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      Text(
                        "otp_number".tr(args: ['2525']),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // Profile Image

                Column(
                  children: [
                    Assets.icons.truck.svg(),
                    5.verticalSpace,
                    const Text(
                      "KE232",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),

            16.verticalSpace,

            // **Message Input Field**
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8),
                        child: Assets.icons.messages
                            .svg(color: Colors.black, height: 10, width: 10),
                      ),
                      hintText: "send_a_message".tr(),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 12, color: AppColors.grey600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            20.verticalSpace,

            // **Action Buttons (Cancel, Call, Pay)**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Flexible(
                //   flex: 1,
                //   child: CustomButtonWidget(
                //     text: context.tr("pay"),
                //     onTap: () {
                //       showPaymentDialog(context,
                //           totalCost: 55, duration: "20 دقيقة", distance: "15");
                //     },
                //     backgroundColor: AppColors.black,
                //     isFiled: true,
                //     height: 52,
                //     radius: 12,
                //     width: MediaQuery.sizeOf(context).width,
                //   ),
                // ),
                8.horizontalSpace,
                Flexible(
                  flex: 3,
                  child: CustomButtonWidget(
                    text: context.tr("call_by", args: ["user"]),
                    onTap: () {},
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 52,
                    radius: 12,
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.phoneIc.svg(),
                        10.horizontalSpace,
                        Text(
                          context.tr("call_by", args: ["user"]),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 15,
                                color: (Colors.white),
                                fontWeight: FontWeight.w500,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                8.horizontalSpace,
                Flexible(
                  flex: 2,
                  child: CustomButtonWidget(
                    text: context.tr("cancel"),
                    onTap: () {
                      showAcceptCancelOrder(context,ref);
                    },
                    color: AppColors.black,
                    borderColor: AppColors.lightestGray,
                    backgroundColor: Colors.white,
                    isFiled: false,
                    height: 52,
                    radius: 12,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ),
              ],
            ),

            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
