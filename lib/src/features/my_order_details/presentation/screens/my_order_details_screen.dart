import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/presentation/controller/my_order_details_controller.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/dotted_path_with_circles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/src/shared_widgets/circle_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class MyOrderDetailsScreen extends ConsumerWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderDetails = ref.watch(myOrderDetailsControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('order_details')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MapSection(orderDetails: orderDetails),
            _buildBodyDetails(context, orderDetails),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyDetails(
      BuildContext context, MyOrderDetailsModel orderDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Driver's Image
              CircleImageWidget(
                imageUrl: orderDetails.driverImage,
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
                    orderDetails.driverName,
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
                        orderDetails.driverRating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14, color: AppColors.nevy),
                      ),
                    ],
                  ),
                  3.verticalSpace,
                  // OTP Number
                  Text(context
                      .tr("otp_number", args: [orderDetails.orderNumber])),
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
                    "KE1234",
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
                    orderDetails.orderTimeStart,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 50),
                  // To Address
                  Text(
                    orderDetails.orderTimeEnd,
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
                    orderDetails.orderStart,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  SizedBox(height: 50),
                  // To Address
                  Text(
                    orderDetails.orderEnd,
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
              context: context, title: "trip_date", details: orderDetails.date),
          _buildSectionDetails(
              context: context,
              title: "bill_details",
              details: "trip_cost",
              detailsValue: context
                  .tr("with_currency", args: [orderDetails.price.toString()])),
          _buildSectionDetails(
              context: context,
              title: "payment_method",
              details: orderDetails.paymentMethod,
              detailsValue: context
                  .tr("with_currency", args: [orderDetails.price.toString()])),
       _buildHelperSection(context, onTap: (){}),
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
    BuildContext context,
     {
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
  final MyOrderDetailsModel orderDetails;
  const MapSection({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Placeholder for the map
        Container(
          height: 200,
          color: Colors.grey,
          child: Center(child: Text("Map goes here")),
        ),
      ],
    );
  }
}
