import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/select_location_from_map_controller.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';

/// **Select Location from Map Button**
class SelectLocationButton extends ConsumerWidget {
  const SelectLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // Reset points when starting new selection
        // ref.read(mapControllerProvider.notifier).resetPoints();
        ref
            .read(selectLocationFromMapControllerProvider.notifier)
            .toggleSelection();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, size: 22, color: Colors.black),
          const SizedBox(width: 5),
          Text(
            "locate_on_map".tr(),
            style:
                Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
