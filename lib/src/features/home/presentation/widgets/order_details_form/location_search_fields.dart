import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/shared_widgets/location_auto_complete_widget.dart';
import 'package:ahtizam/src/shared_widgets/dotted_path_with_circles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// **Search Fields with Circles & Dotted Line**
class LocationSearchFields extends ConsumerWidget {
  const LocationSearchFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLocationController = ref
        .read(locationSearchControllerProvider.notifier)
        .myLocationController;
    final workShopLocationController = ref
        .read(locationSearchControllerProvider.notifier)
        .workShopLocationController;
    final formKey = ref.read(locationSearchControllerProvider.notifier).formKey;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            const SizedBox(
                width: 20, height: 120, child: DottedPathWithCircles()),
            15.horizontalSpace,
            Flexible(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    LocationAutoCompleteField(
                      controller: myLocationController,
                      hintText: "شارع الدوحة",
                      fieldId: 'myLocation', // Unique ID for this field

                      onSelected: (place) {
                        myLocationController.text = place;
                        ref
                            .read(locationSearchControllerProvider.notifier)
                            .onMyLocationChanged(place);

                        debugPrint("Selected Location: ${place}");
                      },
                    ),
                    10.verticalSpace,
                    LocationAutoCompleteField(
                      controller: workShopLocationController,
                      hintText: "تصليح قطر الدولي",
                      fieldId: 'workShopLocation', // Unique ID for this field

                      onSelected: (place) {
                        workShopLocationController.text = place;
                        ref
                            .read(locationSearchControllerProvider.notifier)
                            .onWorkshopLocationChanged(place);
                        debugPrint("Selected Location: ${place}");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
