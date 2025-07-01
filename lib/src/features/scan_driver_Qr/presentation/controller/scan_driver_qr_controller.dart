import 'dart:async';

import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/show_order_form_controller.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/data/repositories/scan_driver_qr_repository.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/domain/model/driver_info_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_driver_qr_controller.g.dart';

@Riverpod(keepAlive: true)
class ScanDriverQrController extends _$ScanDriverQrController {
  // final TextEditingController driverIdController = TextEditingController();

  @override
  Future<ScanDriverQrState?> build() async {
    return ScanDriverQrState(scanned: false);
  }

  Future<void> searchByDriverID(BuildContext context, String driverId) async {
    state = const AsyncLoading();

    debugPrint("...");

    try {
      final repo = ref.read(scanDriverQrRepositoryProvider);
      final result = await repo.fetchByDriverId(driverId: driverId);

      final currentState =
          state.value?.copyWith(driverId: driverId, driverInfoModel: result);
      state = AsyncData(currentState);
      await Future.delayed(Duration(milliseconds: 300));
      await toggleScanedValue(context);

      //  AsyncData(
      //     ScanDriverQrState(trucks: trucks, selectedServiceType: null));
    } catch (e) {
      debugPrint("❌ Error loading trucks: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> toggleScanedValue(BuildContext context) async {
    debugPrint("KARAMANTENA");
    // Navigator.pop(context);

    final currentState = state.value;
    state = AsyncData(currentState!.copyWith(scanned: true));
    Navigator.pop(context);
    Navigator.pop(context);
    ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();

    ref
        .read(showOrderFormControllerProvider.notifier)
        .intialValueToOrder("request_now");
    // Navigator.pop(context);
  }
}

class ScanDriverQrState {
  final bool scanned;
  final String? driverId;
  final DriverInfoModel? driverInfoModel;

  ScanDriverQrState(
      {required this.scanned, this.driverId, this.driverInfoModel});

  ScanDriverQrState copyWith({
    bool? scanned,
    String? driverId,
    DriverInfoModel? driverInfoModel,
  }) {
    return ScanDriverQrState(
      scanned: scanned ?? this.scanned,
      driverId: driverId ?? this.driverId,
      driverInfoModel: driverInfoModel ?? this.driverInfoModel,
    );
  }
}
