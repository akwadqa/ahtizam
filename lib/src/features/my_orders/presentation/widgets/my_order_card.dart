// features/my_orders/presentation/widgets/order_card_widget.dart
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/my_orders/domain/model/my_order_model.dart';
import 'package:ahtizam/src/features/my_orders/presentation/screens/past_order_map_screen.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../shared_widgets/dotted_path_with_circles.dart';
class OrderCardWidget extends StatelessWidget {
  final bool isOngoing;
  final MyOrderModel order;

  const OrderCardWidget({super.key, required this.isOngoing, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.grayBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleImageWidget(
                  imageUrl: order.driverImage,
                  circleWidth: 4,
                  height: 120,
                  width: 120,
                ),
                8.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.driverName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    3.verticalSpace,
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          order.driverRating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14, color: AppColors.nevy),
                        ),
                      ],
                    ),
                    3.verticalSpace,
                    Text(context.tr("otp_number", args: [order.otpNumber])),
                    8.verticalSpace,
                    if (isOngoing)
                      Text(
                        context.tr("payment_method",),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.dark),
                      ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Assets.icons.truck.svg(),
                    6.verticalSpace,
                    Text(
                      order.truckNumber,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    12.verticalSpace,
                    if (isOngoing)
                      Text(
                        order.paymentMethod,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w800, fontSize: 12),
                      ),
                  ],
                ),
              ],
            ),
            if (isOngoing)
              Divider(
                height: 1,
                color: AppColors.lightGray,
              ).symmetricPadding(vertical: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                    width: 20, height: 120, child: DottedPathWithCircles()),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.fromAddress,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    SizedBox(height: 50),
                    Text(
                      order.toAddress,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr("order_number", args: [order.otpNumber]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    20.verticalSpace,
                    Text(
                      context.tr("order_date", args: [order.date]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                    20.verticalSpace,
                    Text(
                      context.tr("order_time", args: [order.time]),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            if (isOngoing) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: CustomButtonWidget(
                      onTap: () {},
                      backgroundColor: AppColors.black,
                      isFiled: true,
                      height: 55,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                      text: "",
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
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: CustomButtonWidget(
                      text: context.tr("message"),
                      onTap: () {},
                      color: AppColors.black,
                      borderColor: AppColors.grayBorder,
                      isFiled: false,
                      height: 55,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                ],
              )
            ],
                if (!isOngoing) ...[
            20.verticalSpace,

                  CustomButtonWidget(
                    onTap: () {
                        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PastOrderMapScreen(
            // userLocation: LatLng(order.userLocation.latitude, order.userLocation.longitude),
            // destinationLocation: LatLng(order.destinationLocation.latitude, order.destinationLocation.longitude),
          ),
        ),
      );
                    },
                    backgroundColor: AppColors.black,
                    isFiled: true,
                    height: 55,
                    radius: 12,
                    width: MediaQuery.sizeOf(context).width,
                    text: context.tr("browse_map"),
                  ).onlyPadding(bottom: 15),
                ]
          ],
        ),
      ),
    );
  }
}
