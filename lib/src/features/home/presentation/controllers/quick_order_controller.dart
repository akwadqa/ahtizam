import 'dart:io';

import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';

part 'quick_order_controller.g.dart';

class OrderState {
  final QuickOrderDetailsModel? orderDetails;
  final QuickOrderModel? orderModel;

  OrderState({this.orderDetails, this.orderModel});

  OrderState copyWith(
      {QuickOrderDetailsModel? orderDetails, QuickOrderModel? orderModel}) {
    return OrderState(
      orderDetails: orderDetails ?? this.orderDetails,
      orderModel: orderModel ?? this.orderModel,
    );
  }
}

@Riverpod(keepAlive: true)
class QuickOrderController extends _$QuickOrderController {
  String? _couponCode;
  bool _hasResetLayersAndOpenedSheet = false;

  @override
  FutureOr<OrderState?> build() => null;

  Future<void> createOrder({String? couponCode}) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(homeRepositoryProvider);
      final user = ref.read(userDataProvider.notifier).userinformation;
      final coords =
          ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
      final serviceType = ref.watch(selectServiceTypeControllerProvider);

      if (coords == null) {
        state = AsyncError('Invalid coordinates', StackTrace.current);
        return;
      }

      final response = await repo.createQuickOrder(
        email: user.email,
        passengerCoordinates: CoordinatesParams(
          lat: coords[0].lat,
          lng: coords[0].lng,
          address: coords[0].address,
        ),
        destinationCoordinates: CoordinatesParams(
          lat: coords[1].lat,
          lng: coords[1].lng,
          address: coords[1].address,
        ),
        searviceItemId: serviceType.value!.selectedServiceType!.serviceId,
        couponCode: couponCode,
      );

      final quickOrderId = response.data?.quickOrderId;
      if (quickOrderId == null || quickOrderId.isEmpty || response.hasFailed) {
        throw Exception(response.message ?? "No available drivers.");
      }

      final current = state.value;
      state = AsyncData(current?.copyWith(orderModel: response.data) ??
          OrderState(orderModel: response.data));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void setNewOrderDetails(QuickOrderDetailsModel? order) {
    final current = state.value;
    state = AsyncData(current?.copyWith(orderDetails: order) ??
        OrderState(orderDetails: order));
  }

  Future<void> startOpenNewOrderSocket(
    BuildContext context, {
    bool showLoading = false,
    required String paymentMethod,
  }) async {
    final repo = ref.read(homeRepositoryProvider);
    final socketService = ref.read(socketServiceProvider);
    final user = ref.read(userDataProvider.notifier).userinformation;
    final coords =
        ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
    final mapScreenshotFile =
        ref.watch(mapControllerProvider.notifier).mapScreenshotFile;

    final order = state.value?.orderModel;

    if (order == null || coords == null) {
      state = AsyncError('Missing order or location data', StackTrace.current);
      return;
    }

    final process = await repo.processQuickOrder(
        quickOrderId: order.quickOrderId,
        paymentMethod: paymentMethod,
        mapImage: mapScreenshotFile);
    if (process.error == 1 || process.data == null) {
      throw Exception(process.message ?? "No available drivers");
    }

    await connectSocketAndListen(
        socketService, order.quickOrderId, user.token, context);
  }

  Future<void> connectSocketAndListen(
    SocketService socketService,
    String quickOrderId,
    String token,
    BuildContext context,
  ) async {
    try {
      await socketService.connect(token);

      socketService.on(quickOrderId, (data) async {
        if (data == null) return;
        debugPrint("🎛️ Received order details: $data");
        final result = QuickOrderDetailsModel.fromJson(data);
        final driverLat = result.driverData?.lat;
        final driverLng = result.driverData?.lng;

        if (driverLat != null && driverLng != null) {
          final driverLocation = LatLng(driverLat, driverLng);
          // final mapCtrl = ref.read(mapControllerProvider.notifier);

          // await mapCtrl.safeAnimateCamera(CameraUpdate.newCameraPosition(
          //   CameraPosition(target: driverLocation, zoom: 17),
          // ));

          await ref
              .read(mapControllerProvider.notifier)
              .updateDriverLocation(driverLocation);
        }

        // ✅ Only first time: reset layers & open bottom sheet
        if (!_hasResetLayersAndOpenedSheet &&
            result.status != "No Driver Found" &&
            result.driverData?.driverId != null) {
          _hasResetLayersAndOpenedSheet = true;

          await ref
              .read(homeServiceProvider.notifier)
              .resetLayers(context); // ensure layers reset

// Delay to ensure navigator has popped cleanly
// await Future.delayed(const Duration(milliseconds: 100));
// if (context.mounted) {
//   showDriverDetailsBottomSheet(context);
// }
          // Future.microtask(() {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     if (context.mounted) {
          //       showDriverDetailsBottomSheet(context);
          //     }
          //   });
          // });
        }

        // ❌ Handle missing driver
        if (result.status == "No Driver Found" ||
            result.driverData?.driverId == null) {
          context.maybePop(); // Close bottom sheet
          state = AsyncError("No Driver Found", StackTrace.current);
          return;
        }

        // ✅ Update order details every time
        setNewOrderDetails(result);
      });
    } catch (e) {
      state = AsyncError("Error connecting to socket", StackTrace.current);
    }
  }

  void resetOrderDetails() {
    debugPrint("resetOrderDetails");

    final current = state.value;
    state = AsyncData(null);
  }

  void setCouponCode(String couponCode) {
    _couponCode = couponCode;
  }
}
