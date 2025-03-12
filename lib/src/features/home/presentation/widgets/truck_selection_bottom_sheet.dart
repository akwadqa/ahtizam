import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/features/home/presentation/controller/select_truck_controller.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../shared_widgets/app_dialogs.dart';
import '../../../../shared_widgets/custom_button_widget.dart';
import '../../../../theme/app_colors.dart';

/// **Truck Selection Provider**
// final selectedTruckProvider = StateProvider<int?>((ref) => null);

/// **Bottom Sheet for Truck Selection**
class TruckSelectionBottomSheet extends ConsumerWidget {
  const TruckSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTruckIndex = ref.watch(selectTruckControllerProvider);
    final List<Map<String, dynamic>> trucks = [
      {"name": "سطحة", "price": "10 ر.ق", "image": Assets.icons.truck.svg()},
      {"name": "سطحة", "price": "10 ر.ق", "image": Assets.icons.truck.svg()},
      {"name": "سطحة", "price": "10 ر.ق", "image": Assets.icons.truck.svg()},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // **Title**
          Text(
            "select_truck_type".tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          15.verticalSpace,

          // **Truck Selection List**
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(trucks.length, (index) {
                final truck = trucks[index];
                final isSelected = selectedTruckIndex == index;

                return GestureDetector(
                  onTap: () => ref
                      .read(selectTruckControllerProvider.notifier)
                      .selectTruck(index),
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            truck["image"]!,
                            10.verticalSpace,
                            Text(truck["name"]!,
                                style: Theme.of(context).textTheme.bodySmall),
                            Text(truck["price"]!,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      if (isSelected)
                        PositionedDirectional(
                            start: 0,
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
                                      borderRadius: BorderRadius.circular(50),
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
              }),
            ),
          ),

          15.verticalSpace,

          // **Extra Details (Checkmarks)**
          if (selectedTruckIndex != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: Colors.black, size: 18),
                5.horizontalSpace,
                Text("delivery_fee".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                Spacer(),
                Text("100 ر.ق",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14)),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: Colors.black, size: 18),
                5.horizontalSpace,
                Text("application_tax".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14)),
                Spacer(),
                Text("100 ر.ق",
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
            onTap: () {
              showSearchingTruckLoading(context: context);
              // ref.read(requestDetailsFormProvider.notifier).state =
              //     true;
            },
            backgroundColor:
                selectedTruckIndex == null ? AppColors.gray : AppColors.black,
            isFiled: true,
            height: 55,
            radius: 15,
            width: MediaQuery.sizeOf(context).width,
          ),
        ],
      ),
    );
  }
}
