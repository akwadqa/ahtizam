import 'dart:async';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/presentation/controller/scan_driver_qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/service_types/service_types_model.dart';
import '../widgets/truck_selection_bottom_sheet.dart';
import 'location_searching_controller/select_location_from_map_controller.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';

part 'select_truck_controller.g.dart';

final List<ServiceTypesModel> trucks = [
  ServiceTypesModel(
    serviceId: "1",
    serviceItem: "سطحة",
    serviceCostPerKm: 10.7,
    vehicleCapacity: "21652731",
    vehiclesSize: "1222",
  ),

  ServiceTypesModel(
    serviceId: "3",
    serviceItem: "ونش",
    serviceCostPerKm: 15.7,
    vehicleCapacity: "21652731",
    vehiclesSize: "1222",
  ),

  // ServiceTypesModel(
  //     id: 3,
  //     name: "قاطرة",
  //     price: "with_currency".tr(args: ['20']),
  //     image: "assets/icons/truck.svg"),
];

@Riverpod(keepAlive: true)
class SelectServiceTypeController extends _$SelectServiceTypeController {
  @override
  Future<ServiceTypesState?> build() async {
    return ServiceTypesState(trucks: trucks, selectedServiceType: null);
  }

  Future<void> getServiceTypesDataInformation(BuildContext context) async {
    state = const AsyncLoading();

    debugPrint("🚚 Fetching trucks...");

    try {
      final isFromMap = ref.watch(selectLocationFromMapControllerProvider);
      final currentLocation = ref.watch(mapControllerProvider);

      if (isFromMap) {
        debugPrint(
            "📍 Location: ${currentLocation.value?.latitude}, ${currentLocation.value?.longitude}");
      }
      final repo = ref.read(homeRepositoryProvider);
      final result = await repo.getServiceTypes();
      // final slom = await ref
      //     .read(serviceTypesControllerProvider.notifier)
      //     .getServiceTypes(context);
      final currentState = state.value?.copyWith(trucks: result.data);
      state = AsyncData(currentState);
      //  AsyncData(
      //     ServiceTypesState(trucks: trucks, selectedServiceType: null));
      // ✅ After loading trucks, check for scanned serviceId
      final scannedServiceId =
          ref.watch(scanDriverQrControllerProvider).value?.driverInfoModel?.serviceType;
      debugPrint(" scanned serviceId => $scannedServiceId");
      if (scannedServiceId != null) {
        final matchedTruck = result.data?.firstWhere(
          (t) => t.serviceId == scannedServiceId,
          orElse: () => throw Exception("No truck found for scanned serviceId"),
        );

        await selectServiceType(matchedTruck!); // ✅ Auto-select truck
          await ref.read(quickOrderControllerProvider.notifier).createOrder();

      }
      await Future.delayed(const Duration(milliseconds: 300));
      showTruckSelectionBottomSheet(
        context: context,
      );
    } catch (e) {
      debugPrint("❌ Error loading trucks: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> selectServiceType(ServiceTypesModel selectedServiceType) async {
    try {
      // Mark loading
      state = const AsyncLoading();

      // Wait for current data
      final currentState =
          state.value?.copyWith(selectedServiceType: selectedServiceType);

      // Create updated state with selected truck
      final updatedState = state.copyWithPrevious(AsyncData(currentState!));

      // Call createOrder using this updated state
      // await ref.read(quickOrderControllerProvider.notifier).createOrder(updatedState);

      // After order is created, emit updated state
      state = updatedState;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void clearSelection() {
    state = state.whenData((ServiceTypesState) =>
        ServiceTypesState?.copyWith(selectedServiceType: null));
  }
}

class ServiceTypesState {
  final List<ServiceTypesModel> trucks;
  final ServiceTypesModel? selectedServiceType;

  ServiceTypesState({required this.trucks, this.selectedServiceType});

  ServiceTypesState copyWith(
      {List<ServiceTypesModel>? trucks,
      ServiceTypesModel? selectedServiceType}) {
    return ServiceTypesState(
      trucks: trucks ?? this.trucks,
      selectedServiceType: selectedServiceType,
    );
  }
}
