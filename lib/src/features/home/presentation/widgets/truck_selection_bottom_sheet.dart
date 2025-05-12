import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../shared_widgets/app_dialogs.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';
import '../../application/map_service.dart';
import '../controllers/toggle_layers_controllers/show_order_form_controller.dart';
import '../controllers/order_controller.dart';

/// **Bottom Sheet for Truck Selection**
class TruckSelectionBottomSheet extends ConsumerWidget {
  final GeoPoint pickupLocation;
  final GeoPoint workshopLocation;

  const TruckSelectionBottomSheet({
    super.key,
    required this.pickupLocation,
    required this.workshopLocation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final truckState = ref.watch(selectTruckControllerProvider);
    final orderState = ref.watch(orderControllerProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: truckState.when(
        loading: () => const Center(child: FadeCircleLoadingIndicator()),
        error: (error, _) => Center(
          child: Text("Error loading trucks: $error",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        data: (state) {
          final selectedTruck = state.selectedTruck;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // **Title**
              Text(
                "select_truck_type".tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              20.verticalSpace,

              // **Truck Selection List**
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.trucks.map((truck) {
                    final isSelected = selectedTruck?.id == truck.id;
                    return GestureDetector(
                      onTap: () => ref
                          .read(selectTruckControllerProvider.notifier)
                          .selectTruck(truck),
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? AppColors.primary : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.gray,
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Assets.icons.truck.svg(),
                                10.verticalSpace,
                                Text(truck.name,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Text(truck.price,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          if (isSelected)
                            PositionedDirectional(
                                end: 0,
                                top: -5,
                                child: IconButton(
                                    onPressed: () {
                                      showTruckDetailsDialog(
                                        context: context,
                                        weight: "1200",
                                        scales: "8ft x 4.5ft x 5.5ft",
                                      );
                                    },
                                    icon: ClipOval(
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          // color: Colors.grey.shade300,
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.more_vert,
                                          size: 15,
                                        ),
                                      ),
                                    )))
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              25.verticalSpace,

              // **Extra Details (Checkmarks)**
              if (selectedTruck != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColors.black, size: 18),
                    5.horizontalSpace,
                    Text("delivery_fee".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14)),
                    Spacer(),
                    Text("with_currency".tr(args: ['100']),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14)),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColors.black, size: 18),
                    5.horizontalSpace,
                    Text("application_tax".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14)),
                    Spacer(),
                    Text("with_currency".tr(args: ['100']),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14)),
                  ],
                ),
              ],
              25.verticalSpace,

              CustomButtonWidget(
                text: context.tr("request_truck"),
                onTap: selectedTruck == null
                    ? null
                    : () async {
                        // try {
                          await ref
                              .read(mapControllerProvider.notifier)
                              .captureScreenshot();

                          showSearchingTruckLoading(context: context);
                       
                  Future.delayed(Duration(seconds: 5), () {

                                 Navigator.pop(context);
                                    Navigator.pop(context);
                                              ref
                                .read(showOrderFormControllerProvider.notifier)
                                .initiallValue ==
                            "request_offer"
                        ? context.pushRoute(PricesOfferRoute())
                        : showDriverDetailsBottomSheet(context);
                  });

                  // });

                          // Create order
                          // await ref
                          //     .read(orderControllerProvider.notifier)
                          //     .createOrder(
                          //       pickupLat: pickupLocation.latitude,
                          //       pickupLng: pickupLocation.longitude,
                          //       workshopLat: workshopLocation.latitude,
                          //       workshopLng: workshopLocation.longitude,
                          //       truckType: selectedTruck.id.toString(),
                          //       price: parsedPrice,
                          //     );

                          // Listen to order state changes
                        //   ref.listen(orderControllerProvider, (previous, next) {
                        //     next.whenData((order) {
                        //       if (order != null) {
                        //         switch (order.status) {
                        //           case 'accepted':
                        //             Navigator.pop(context); // Close loading
                        //             Navigator.pop(
                        //                 context); // Close bottom sheet
                        //             showDriverDetailsBottomSheet(context);
                        //             break;
                        //           case 'rejected':
                        //             // Order was rejected, system will automatically try next driver
                        //             break;
                        //           case 'completed':
                        //             Navigator.pop(context);
                        //             Navigator.pop(context);
                        //             break;
                        //         }
                        //       }
                        //     });
                        //   });
                        // } catch (e) {
                        //   Navigator.pop(context); // Close any open sheet/dialog
                        //   // shows(context, "❌ ${"order_failed".tr()}: $e");
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: Text(e.toString()),
                        //     backgroundColor: Colors.redAccent,
                        //   ));
                        // }
                      },
                backgroundColor:
                    selectedTruck == null ? AppColors.gray : AppColors.black,
                isFiled: true,
                height: 55,
                radius: 15,
                width: MediaQuery.sizeOf(context).width,
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<void> showTruckSelectionBottomSheet({
  required BuildContext context,
  required GeoPoint pickupLocation,
  required GeoPoint workshopLocation,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => TruckSelectionBottomSheet(
      pickupLocation: pickupLocation,
      workshopLocation: workshopLocation,
    ),
  );
}
