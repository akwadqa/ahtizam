import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:standard_project/src/features/home/presentation/controller/select_location_from_map_controller.dart';
import 'package:standard_project/src/features/home/presentation/controller/show_order_form_controller.dart';
import 'package:standard_project/src/features/home/presentation/widgets/order_details_form/order_types_drop_down_widget.dart';

import 'package:standard_project/src/extenssions/widget_extensions.dart';
import 'package:standard_project/src/extenssions/int_extenssion.dart';
import 'location_search_fields.dart';
import 'select_location_button.dart';

/// **Request Details Form (Appears Under App Bar)**
class RequestDetailsForm extends ConsumerWidget {
  const RequestDetailsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectLocationFromMap =
        ref.watch(selectLocationFromMapControllerProvider);

    return Positioned(
      top: isSelectLocationFromMap ? 90 : null,
      bottom: isSelectLocationFromMap ? null : 100,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    ref
                        .read(showOrderFormControllerProvider.notifier)
                        .toggleVisibility();
                    ref
                        .read(selectLocationFromMapControllerProvider.notifier)
                        .toggleSelection();
                  },
                  child: _restorerBackArrow(ref),
                ).onlyPadding(bottom: 2, top: 8),
                const OrdersTypeDropDownWidget().onlyPadding(start: 35),
                10.verticalSpace,
                const LocationSearchFields(),
                20.verticalSpace,
                if (!isSelectLocationFromMap)
                  const SelectLocationButton().onlyPadding(bottom: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _restorerBackArrow(WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();
          ref
              .read(selectLocationFromMapControllerProvider.notifier)
              .toggleSelection();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 18,
        ).onlyPadding(bottom: 12, start: 35));
  }
}
