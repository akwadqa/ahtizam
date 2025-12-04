import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/home/domain/models/order/price_offer/driver_offer_model.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/utils/functions.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared_widgets/app_dialogs.dart';
import '../../../../shared_widgets/circle_image_widget.dart';
import '../../../../shared_widgets/custom_button_widget.dart';

class PriceOfferCard extends ConsumerWidget {
  final DriverOfferModel priceOfferModel;

  const PriceOfferCard({super.key, required this.priceOfferModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceStr = processEtaValue(
      priceOfferModel.eta,
      1,
    ); // e.g., "1.5 كم"
    final timeStr = processEtaValue(priceOfferModel.eta, 2);
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
                    imageUrl: priceOfferModel.driverImage != null
                        ? ServicesUrls.imageUrl + priceOfferModel.driverImage!
                        : null,
                    height: 155,
                    width: 155,
                  ),
                  // if (priceOfferModel.isDriverVerified)
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: Assets.icons.verifiedCheckIc.svg(),
                  ),
                ],
              ),
              8.horizontalSpace,
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelItem(
                      context,
                      Assets.icons.profile,
                      priceOfferModel.driverName,
                    ),
                    _buildLabelItem(
                      context,
                      Assets.icons.idIc,
                      priceOfferModel.driverId,
                      isColorful: true,
                    ),
                    _buildLabelItem(
                      context,
                      Assets.icons.locationIc,
                      priceOfferModel.driverAddress,
                    ),
                    _buildLabelItem(
                      context,
                      Assets.icons.timeIc,
                      "$distanceStr - $timeStr",
                    ),
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
                            weight: priceOfferModel.vehicleSize ?? "1200",
                            serviceTypeName: priceOfferModel.vehicleType,
                            scales:
                                priceOfferModel.vehicleCapacity ??
                                "8ft x 4.5ft x 5.5ft",
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
                        priceOfferModel.vehicleType,
                        // "g2782by",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Icon(Icons.star, size: 15, color: Colors.amber),
                      8.horizontalSpace,
                      Text(
                        priceOfferModel.driverRating.toString(),
                        // "2",
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
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final asyncData = ref.watch(priceOfferControllerProvider);
              final eta = priceOfferModel.eta;

              // final distanceStr = processEtaValue(eta, 1); // e.g., "1.5 كم"
              // final timeStr = processEtaValue(eta, 2);
              // if (asyncData is AsyncError) {
              //   showErrorDialog(context, "Something wrong");
              // }
              ref.listen(priceOfferControllerProvider, (prev, next) {
                // if (next is AsyncLoading) {
                //   debugPrint("loading🌀");
                // showDialog(
                //   context: context,
                //   barrierDismissible: false,
                //   builder: (_) =>
                //       const Center(child: FadeCircleLoadingIndicator()),
                // );
                // }
                if (next is AsyncError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Navigator.pop(context); // Close loading dialog if open
                    showErrorDialog(
                      context,
                      next.error.toString() ?? "error occured",
                    );
                  });
                }
                // if (next is AsyncData) {
                //   // final response = next.value;
                //   debugPrint("data done done ");
                //   showPaymentDialog(
                //     context,
                //     totalCost: priceOfferModel.price,
                //     duration: timeStr,
                //     distance: distanceStr,
                //   );
                // }
              });

              return asyncData is AsyncLoading
                  ? FadeCircleLoadingIndicator()
                  : CustomButtonWidget(
                      text: context.tr(
                        "order_price_offer",
                        args: [priceOfferModel.price.toString()],
                      ),
                      onTap: asyncData is AsyncLoading
                          ? null
                          : () async {
                              final result = await ref
                                  .read(priceOfferControllerProvider.notifier)
                                  .selectPriceOffer(priceOfferModel);
                              if (result) {
                                await showPaymentDialog(
                                  context,
                                  totalCost: priceOfferModel.price,
                                  duration: distanceStr,
                                  distance: timeStr,
                                );
                              }
                              // Navigator.pop(context);
                              // showDriverDetailsBottomSheet(context);
                            },
                      backgroundColor: AppColors.primary,
                      isFiled: true,
                      height: 50,
                      radius: 12,
                      width: MediaQuery.sizeOf(context).width,
                    ).symmetricPadding(vertical: 4, horizontal: 4);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLabelItem(
    BuildContext context,
    SvgGenImage icon,
    String title, {
    bool? isColorful,
  }) {
    return Row(
      children: [
        icon.svg(color:isColorful!=null?null: AppColors.black, height: 20, width: 20),
        6.horizontalSpace,
        Expanded(
          child: Text(
            title,
            // textDirection: isPhone != null ? TextDirection.ltr : null,
            softWrap: true, // 👈 يخلي النص ينزل سطر جديد
            overflow: TextOverflow.visible,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.black),
          ),
        ),
      ],
    ).onlyPadding(bottom: 8);
  }
}
