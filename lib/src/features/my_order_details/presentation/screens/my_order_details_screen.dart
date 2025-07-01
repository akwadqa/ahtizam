import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/numbers_extension.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/presentation/controller/my_order_details_controller.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/shared_widgets/app_cached_network_image.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/app_error_widget.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/dotted_path_with_circles.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class MyOrderDetailsScreen extends ConsumerWidget {
  final String quickOrderId;
  const MyOrderDetailsScreen({
    super.key,
    required this.quickOrderId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOrderDetails =
        ref.watch(myOrderDetailsControllerProvider(quickOrderId));
    final locale = ref.watch(currentLanguageProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: CustomAppbar(title: context.tr('order_details')),
        ),
        body: asyncOrderDetails.when(
          data: (orderDetails) {
            // if(orderDetails==null){
            //   return SizedBox.expand();
            // }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MapSection(mapImage: orderDetails?.mapImage),
                  _buildBodyDetails(context, orderDetails!, locale),
                ],
              ),
            );
          },
          error: (error, stackTrace) =>
            AppErrorWidget(),
          loading: () => FadeCircleLoadingIndicator().centered(),
        ));
  }

  Widget _buildBodyDetails(
      BuildContext context, MyOrderDetailsModel orderDetails, String locale) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Driver's Image

              CircleImageWidget(
                imageUrl: ServicesUrls.imageUrl +
                    orderDetails.driverDetails.profileImage!,
                circleWidth: 4,
                height: 120,
                width: 120,
              ),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver's Name
                  Text(
                    orderDetails.driverDetails.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  3.verticalSpace,
                  Row(
                    children: [
                      // Driver's Rating
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        
                           orderDetails.driverDetails.rating != null
                                  ? orderDetails.driverDetails.rating.toString():"no_rating_yet".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14, color: AppColors.nevy),
                      ),
                    ],
                  ),
                  // 3.verticalSpace,
                  // OTP Number
                  // Text(context
                  //     .tr("otp_number", args: [orderDetails.orderNumber])),
                  8.verticalSpace,
                  // Payment Method
                  // Text(
                  //   context.tr("payment_method"),
                  //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 12,
                  //       color: AppColors.dark),
                  // ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icons.truck.svg(),
                  12.verticalSpace,
                  Text(
                    orderDetails.serviceType,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // From Address
                  Text(
                    orderDetails.startTime,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 50),
                  // To Address
                  Text(
                    orderDetails.endTime,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              10.horizontalSpace,

              // Dotted Path for Location (Placeholder for the map)
              const SizedBox(
                  width: 20, height: 120, child: DottedPathWithCircles()),
              28.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // From Address
                  Text(
                    orderDetails.passengerLocation.address,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 50),
                  // To Address
                  Text(
                    orderDetails.destinationLocation.address,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 1, color: AppColors.lightGray)
              .onlyPadding(top: 8, bottom: 18),
          _buildSectionDetails(
              context: context,
              title: "trip_date",
              details: orderDetails.creationDate.toArabicDate(locale)),
          _buildSectionDetails(
              context: context,
              title: "bill_details",
              details: "trip_cost",
              detailsValue: context.tr("with_currency",
                  args: [orderDetails.fareDetails.finalFare.toString()])),
          _buildSectionDetails(
              context: context,
              title: "payment_method",
              details: orderDetails.paymentMethod,
              detailsValue: context.tr("with_currency",
                  args: [orderDetails.fareDetails.baseFare.toString()])),
          _buildHelperSection(context, onTap: () {}),
          //  20.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildSectionDetails(
      {required BuildContext context,
      required String title,
      required String details,
      String? detailsValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black),
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              details,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            Text(
              detailsValue ?? '',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ],
        ),
        Divider(height: 1, color: AppColors.lightGray)
            .symmetricPadding(vertical: 18),
      ],
    );
  }

  Widget _buildHelperSection(
    BuildContext context, {
    required VoidCallback onTap,
    // bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "get_help".tr(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          onTap: onTap,
        ),
      ],
    );
  }
}

class MapSection extends StatelessWidget {
  final String? mapImage;
  const MapSection({super.key, required this.mapImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.grey,
      child: mapImage != null
          ? AppCachedNetworkImage(
              imageUrl: ServicesUrls.imageUrl + mapImage!,
              
              fit: BoxFit.cover,
            )
          : Center(child: Text("Map goes here")),
    );
  }
}
