import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/select_location_from_map_controller.dart';
import 'package:ahtizam/src/utils/functions.dart';

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
import '../controllers/toggle_layers_controllers/show_order_form_controller.dart';
import '../controllers/quick_order_controller.dart';

/// **Bottom Sheet for Truck Selection**
class TruckSelectionBottomSheet extends ConsumerWidget {
  const TruckSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final truckState = ref.watch(selectServiceTypeControllerProvider);
    final orderState = ref.watch(quickOrderControllerProvider);

    ref.listen<AsyncValue<OrderState?>>(
      quickOrderControllerProvider,
      (prev, next) {
        debugPrint("📡 Listener triggered: $next");

        if (next is AsyncLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              
              builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
            );
          });
        }

        if (next is AsyncError) {
          debugPrint("❌ Error in controller: ${next.error}");
          ref
              .read(selectServiceTypeControllerProvider.notifier)
              .clearSelection();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            // ref.read(selectServiceTypeControllerProvider.notifier).clearSelection();

            showErrorDialog(context, next.error.toString());
          });
        }

        if (next is AsyncData) {
          debugPrint("✅ Order data received: ${next.value}");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context, rootNavigator: true).canPop()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          });
        }
      },
    );

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
          final selectedTruck = state?.selectedServiceType;

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
                  children: state!.trucks.map((truck) {
                    final isSelected =
                        selectedTruck?.serviceId == truck.serviceId;
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(selectServiceTypeControllerProvider.notifier)
                            .selectServiceType(truck);
                        ref
                            .read(quickOrderControllerProvider.notifier)
                            .createOrder(
                            );
                      },
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
                                Text(truck.serviceItem,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Text(
                                    "with_currency".tr(args: [
                                      truck.serviceCostPerKm.toString()
                                    ]),
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
                                        serviceTypeName: truck.serviceItem,
                                        weight: truck.vehicleCapacity,
                                        scales: truck.vehiclesSize,
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
              if (selectedTruck != null &&
                  orderState.value?.orderModel != null) ...[
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
                    Text(
                        "with_currency".tr(args: [
                          orderState.value!.orderModel!.baseFee.toString()
                        ]),
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
                    Text(
                        "with_currency".tr(args: [
                          orderState.value!.orderModel?.taxFee.toString() ??
                              "90"
                        ]),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14)),
                  ],
                ),
              ],
              25.verticalSpace,

              Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final eta = orderState.value?.orderModel?.eta;

                final distanceStr = processEtaValue(eta, 1); // e.g., "1.5 كم"
                final timeStr = processEtaValue(eta, 2); // e.g., "5 دقيقة"
                // ref.listen(quickOrderControllerProvider, (prev, next) {
                //   if (next is AsyncLoading) {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {
                //       showSearchingTruckLoading(context: context);
                //     });
                //   }
                //   if (next is AsyncError) {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {
                //       Navigator.pop(context); // Close loading dialog if open
                //       showErrorDialog(context, next.error.toString());
                //     });
                //   }

                //   if (next is AsyncData) {
                //     final response = next.value;

                //     final isSelectLocationFromMap =
                //         ref.watch(selectLocationFromMapControllerProvider);

                //     // Navigator.pop(context); // Close loading
                //     // Navigator.pop(context); // Close bottom sheet
                //     // ref
                //     //     .read(changeRequestOrderStateServiceProvider.notifier)
                //     //     .toggleWidget();
                //     // ref
                //     //     .read(showOrderFormControllerProvider.notifier)
                //     //     .toggleVisibility();
                //     //       ref
                //     //     .read(hideLayersDuringOrderControllerProvider.notifier)
                //     //     .hideLayersDuringOrder();
                //     if (isSelectLocationFromMap) {
                //       ref
                //           .read(selectLocationFromMapControllerProvider
                //               .notifier)
                //           .toggleSelection();
                //     }

                //     final value = ref
                //         .read(showOrderFormControllerProvider.notifier)
                //         .initiallValue;

                //     // WidgetsBinding.instance.addPostFrameCallback((_) {
                //     if (value == "request_offer") {
                //       context.pushRoute(PricesOfferRoute());
                //     } else {
                //       showDriverDetailsBottomSheet(context);
                //     }
                //     // });
                //   }
                // });

                return CustomButtonWidget(
                  text: context.tr("request_truck"),
                  onTap: selectedTruck == null
                      ? null
                      : () async {
                          showPaymentDialog(
                            context,
                            totalCost:
                                orderState.value?.orderModel?.finalFee ?? 0,
                            duration: distanceStr,
                            distance: timeStr,
                          );
                          //  await ref
                          //           .read(quickOrderControllerProvider.notifier)
                          //           .createOrder();
                        },
                  backgroundColor:
                      selectedTruck == null ? AppColors.gray : AppColors.black,
                  isFiled: true,
                  height: 55,
                  radius: 15,
                  width: MediaQuery.sizeOf(context).width,
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

Future<void> showTruckSelectionBottomSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => TruckSelectionBottomSheet(),
  );
}

void showInfoDialog({
  required BuildContext context,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Notice"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("OK"),
        ),
      ],
    ),
  );
}
