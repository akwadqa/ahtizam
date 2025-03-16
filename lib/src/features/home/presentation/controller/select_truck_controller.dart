import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/verification_code/domain/model/truck_model.dart';
import '../widgets/truck_selection_bottom_sheet.dart';
import 'select_location_from_map_controller.dart';
import 'package:standard_project/src/features/home/application/map_service.dart';

part 'select_truck_controller.g.dart';

@Riverpod(keepAlive: true)
class SelectTruckController extends _$SelectTruckController {
  @override
  Future<TruckState> build() async {
    return TruckState(
        trucks: [], selectedTruck: null); // ✅ Correctly typed state
  }

  Future<void> getTrucksDataInformation(BuildContext context) async {
    state = const AsyncLoading(); // ✅ Set loading state

    debugPrint("🚀 Fetching trucks...");

    try {
      final isFromMap = ref.watch(selectLocationFromMapControllerProvider);
      final currentLocation = ref.watch(mapControllerProvider);

      if (isFromMap) {
        debugPrint("📍 Address Lat: ${currentLocation.value?.latitude}");
        debugPrint("📍 Address Lng: ${currentLocation.value?.longitude}");
      }
      await Future.microtask(() => showTruckSelectionBottomSheet(context));

      // Simulating API call with a delay

      // Sample trucks from API
      final List<Truck> trucks = [
        Truck(
            id: 1,
            name: "سطحة",
            price: "with_currency".tr(args: ['10']),
            image: "assets/icons/truck.svg"),
        Truck(
            id: 2,
            name: "ونش",
            price: "with_currency".tr(args: ['12']),
            image: "assets/icons/truck.svg"),
        Truck(
            id: 3,
            name: "قاطرة",
            price: "with_currency".tr(args: ['20']),
            image: "assets/icons/truck.svg"),
      ];

      // ✅ Debugging Log
      debugPrint("✅ Trucks Loaded: ${trucks.length}");
      await Future.delayed(const Duration(seconds: 2));

      // ✅ Set state with truck list
      state = AsyncData(TruckState(trucks: trucks, selectedTruck: null));

      // ✅ Ensure Bottom Sheet Opens **AFTER** Data is Ready
    } catch (e) {
      debugPrint("❌ Error fetching trucks: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }

  /// **Select a Truck**
  void selectTruck(Truck selectedTruck) {
    state = state.whenData(
        (truckState) => truckState.copyWith(selectedTruck: selectedTruck));
  }

  /// **Clear Selection**
  void clearSelection() {
    state = state
        .whenData((truckState) => truckState.copyWith(selectedTruck: null));
  }
}

class TruckState {
  final List<Truck> trucks;
  final Truck? selectedTruck;

  TruckState({required this.trucks, this.selectedTruck});

  TruckState copyWith({List<Truck>? trucks, Truck? selectedTruck}) {
    return TruckState(
      trucks: trucks ?? this.trucks,
      selectedTruck: selectedTruck,
    );
  }
}
