import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/verification_code/domain/model/truck_model.dart';
import '../widgets/truck_selection_bottom_sheet.dart';
import 'location_searching_controller/select_location_from_map_controller.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';

part 'select_truck_controller.g.dart';

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
@Riverpod(keepAlive: true)
class SelectTruckController extends _$SelectTruckController {
  @override
  Future<TruckState> build() async {
    
    return TruckState(trucks: trucks, selectedTruck: null);
  }

  Future<void> getTrucksDataInformation(BuildContext context) async {
    state = const AsyncLoading();

    debugPrint("🚚 Fetching trucks...");

    try {
      final isFromMap = ref.watch(selectLocationFromMapControllerProvider);
      final currentLocation = ref.watch(mapControllerProvider);

      if (isFromMap) {
        debugPrint(
            "📍 Location: ${currentLocation.value?.latitude}, ${currentLocation.value?.longitude}");
      }

      // Simulate API or Firebase call
      // await Future.delayed(const Duration(seconds: 2));


      state = AsyncData(TruckState(trucks: trucks, selectedTruck: null));

      await Future.delayed(const Duration(milliseconds: 300));
      showTruckSelectionBottomSheet(
        context: context,
        pickupLocation: GeoPoint(
            currentLocation.value!.latitude, currentLocation.value!.longitude),
        workshopLocation: GeoPoint(currentLocation.value!.latitude + 0.01,
            currentLocation.value!.longitude + 0.01), // Example
      );
    } catch (e) {
      debugPrint("❌ Error loading trucks: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }

  void selectTruck(Truck selectedTruck) {
    state = state.whenData(
        (truckState) => truckState.copyWith(selectedTruck: selectedTruck));
  }

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
