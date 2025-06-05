import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/gen/assets.gen.dart';

import '../../../../shared_widgets/app_dialogs.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import '../controllers/prices_order_data_controller.dart';

class PriceOfferCard extends StatelessWidget {
  final PriceOfferModel priceOfferModel;

  const PriceOfferCard({
    super.key,
    required this.priceOfferModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightestGray),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleImageWidget(
                    imageUrl: priceOfferModel.driverImage,
                    height: 155,
                    width: 155,
                  ),
                  if (priceOfferModel.isDriverVerified)
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: Assets.icons.verifiedCheckIc.svg(),
                    )
                ],
              ),
              8.horizontalSpace,
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelItem(context, Assets.icons.profile,
                        priceOfferModel.driverName),
                    _buildLabelItem(context, Assets.icons.phoneIc,
                        priceOfferModel.driverPhoneNumber,
                        isPhone: true),
                    _buildLabelItem(context, Assets.icons.locationIc,
                        priceOfferModel.location),
                    _buildLabelItem(context, Assets.icons.timeIc,
                        priceOfferModel.expectedTime),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Assets.icons.truck.svg(),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showTruckDetailsDialog(
                            context: context,
                            weight: "1200",
                            serviceTypeName: "serviceTypeName",
                            scales: "8ft x 4.5ft x 5.5ft",
                          );
                        },
                        child: ClipOval(
                          child: Container(
                            height: 16,
                            margin: EdgeInsets.zero,
                            width: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // color: Colors.grey.shade300,
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.more_vert,
                              color: AppColors.primary,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        priceOfferModel.truckNumber,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      8.horizontalSpace,
                      Text(
                        priceOfferModel.driverRating,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CustomButtonWidget(
            text: context.tr("order", args: [priceOfferModel.price]),
            onTap: () {
              Navigator.pop(context);
              showDriverDetailsBottomSheet(context);
            },
            backgroundColor: AppColors.primary,
            isFiled: true,
            height: 50,
            radius: 12,
            width: MediaQuery.sizeOf(context).width,
          ).symmetricPadding(vertical: 4, horizontal: 4),
        ],
      ),
    );
  }

  Widget _buildLabelItem(BuildContext context, SvgGenImage icon, String title,
      {bool? isPhone}) {
    return Row(
      children: [
        icon.svg(
          color: AppColors.black,
          height: 20,
          width: 20,
        ),
        6.horizontalSpace,
        Text(
          title,
          textDirection: isPhone != null ? TextDirection.ltr : null,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: AppColors.black),
        ),
      ],
    ).onlyPadding(bottom: 8);
  }
}
