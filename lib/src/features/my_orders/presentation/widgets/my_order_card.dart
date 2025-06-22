// features/my_orders/presentation/widgets/order_card_widget.dart
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/numbers_extension.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/my_orders/domain/model/my_order_model.dart';
import 'package:ahtizam/src/features/my_orders/presentation/screens/past_order_map_screen.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../shared_widgets/dotted_path_with_circles.dart';

class OrderCardWidget extends ConsumerWidget {
  final bool isOngoing;
  final MyOrderDetailsModel order;

  const OrderCardWidget(
      {super.key, required this.isOngoing, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(currentLanguageProvider);

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
                  imageUrl:
                      ServicesUrls.imageUrl + order.driverDetails.profileImage!,
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
                      order.driverDetails.fullName,
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
                          order.driverDetails.rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14, color: AppColors.nevy),
                        ),
                      ],
                    ),
                    // 3.verticalSpace,
                    // Text(context.tr("otp_number", args: [order.otpNumber])),
                    8.verticalSpace,
                    if (isOngoing)
                      Text(
                        context.tr(
                          "payment_method",
                        ),
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
                      order.serviceType,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.passengerLocation.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      SizedBox(height: 50),
                      Text(
                        order.destinationLocation.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr("order_number", args: [order.quickOrderId]),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      20.verticalSpace,
                      Text(
                        context.tr("order_date",
                            args: [order.creationDate.toArabicDate(locale)]),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      20.verticalSpace,
                      Text(
                        context.tr("order_time", args: [
                          order.creationTime.formatTimeLocalized(context)
                        ]),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
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
                      onTap: () {
                        if (order.driverDetails.driverPhone != "") {
                          final Uri telLaunchUri = Uri(
                            scheme: 'tel',
                            path: order.driverDetails.driverPhone,
                          );
                          launchUrl(telLaunchUri);
                        }
                      },
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
                            context.tr("call_by",
                                args: [order.driverDetails.fullName]),
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
