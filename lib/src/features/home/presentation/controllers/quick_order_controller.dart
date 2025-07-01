import 'dart:io';

import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/home_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import 'package:ahtizam/src/features/payment/presentation/controller/payment_controller.dart';
import 'package:ahtizam/src/routing/app_routes.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
  bool _handledNoDriverOnce = false;

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

  Future<void> setNewOrderDetails(QuickOrderDetailsModel? order) async {
    final current = state.value;
    state = AsyncData(current?.copyWith(orderDetails: order) ??
        OrderState(orderDetails: order));
  }

  Future<void> startOpenNewOrderSocket(
    BuildContext context, {
    required String paymentMethod,
  }) async {
    final repo = ref.read(homeRepositoryProvider);
    final socketService = ref.read(socketServiceProvider);
    final user = ref.read(userDataProvider.notifier).userinformation;
    final coords =
        ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
    final mapScreenshotFile =
        ref.watch(mapControllerProvider.notifier).mapScreenshotFile;
    final paymentController = ref.read(paymentControllerProvider.notifier);

    final order = state.value?.orderModel;

    if (order == null || coords == null) {
      state = AsyncError('Missing order or location data', StackTrace.current);
      return;
    }

    final process = await repo.processQuickOrder(
        quickOrderId: order.quickOrderId,
        paymentMethod: paymentMethod,
        mapImage: mapScreenshotFile);
// ✅ Always mark as paid first!
    paymentController.isOrderPaied();

    if (process.error == 1 || process.data == null) {
      showNoDriverException(context, process.message);
      return;
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
      final mapService = ref.read(mapControllerProvider.notifier);
      await socketService.connect(token);
      socketService.on(quickOrderId, (data) async {
        if (data == null) return;
        debugPrint("🎛️ Received order details: $data");
        final result = QuickOrderDetailsModel.fromJson(data);
        final driverLat = result.driverData?.lat;
        final driverLng = result.driverData?.lng;
        // if (_handledNoDriverOnce) return;

        if (result.status == "No Driver Found" ||
            result.driverData?.driverId == null) {
          socketService.disconnect();

          showNoDriverException(context, result.status);

          return;
        }
        if (driverLat != null && driverLng != null) {
          final driverLocation = LatLng(driverLat, driverLng);
          // final mapCtrl = ref.read(mapControllerProvider.notifier);

          // await mapCtrl.safeAnimateCamera(CameraUpdate.newCameraPosition(
          //   CameraPosition(target: driverLocation, zoom: 17),
          // ));
          await mapService.updateDriverLocation(driverLocation);
          await mapService.getPolylineDriverToMePoints();
        }

        // ✅ Only first time: reset layers & open bottom sheet
        if (!_hasResetLayersAndOpenedSheet &&
            result.status != "No Driver Found" &&
            result.driverData?.driverId != null) {
          _hasResetLayersAndOpenedSheet = true;

          await ref
              .read(homeServiceProvider.notifier)
              .resetLayers(context); // ensure layers reset
          await setNewOrderDetails(result);
        }
      });
    } catch (e) {
      state = AsyncError("Error connecting to socket", StackTrace.current);
    }
  }

  Future<void> showNoDriverException(
      BuildContext context, String? message) async {
    if (Navigator.canPop(context)) Navigator.pop(context);
    await showAutoClosingDialog(
      context,
      "${message ?? "No available drivers."}\n${"try_again".tr(context: context)}",
    );
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
