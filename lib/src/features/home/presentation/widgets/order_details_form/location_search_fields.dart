import 'package:flutter/material.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'package:standard_project/src/shared_widgets/location_auto_complete_widget.dart';
import 'package:standard_project/src/shared_widgets/dotted_path_with_circles.dart';

/// **Search Fields with Circles & Dotted Line**
class LocationSearchFields extends StatelessWidget {
  const LocationSearchFields({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController myLocationController = TextEditingController();
    final TextEditingController workShopLocationController =
        TextEditingController();

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            const SizedBox(
                width: 20, height: 120, child: DottedPathWithCircles()),
            15.horizontalSpace,
            Flexible(
              child: Column(
                children: [
                  LocationAutoCompleteField(
                    controller: myLocationController,
                    hintText: "شارع الدوحة",
                    onSelected: (place) {
                      print("Selected Location: ${place}");
                    },
                  ),
                  // LocationAutoCompleteField(
                  //   controller: myLocationController,
                  //   hintText: "شارع الدوحة",
                  // ),
                  10.verticalSpace,
                  LocationAutoCompleteField(
                    controller: workShopLocationController,
                    hintText: "تصليح قطر الدولي",
                    onSelected: (place) {
                      print("Selected Location: ${place}");
                    },
                  ),
                  // LocationAutoCompleteField(
                  //   controller: workShopLocationController,
                  //   hintText: "تصليح قطر الدولي",
                  // ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
