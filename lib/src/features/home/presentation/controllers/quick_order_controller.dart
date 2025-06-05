import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/application/map_service.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';
import 'package:ahtizam/src/features/home/presentation/widgets/driver_details_widgets/driver_details_bottom_sheet.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:flutter/material.dart';
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

  OrderState copyWith({QuickOrderDetailsModel? orderDetails, QuickOrderModel? orderModel}) {
    return OrderState(
      orderDetails: orderDetails ?? this.orderDetails,
      orderModel: orderModel ?? this.orderModel,
    );
  }
}

@Riverpod(keepAlive: true)
class QuickOrderController extends _$QuickOrderController {
  String? _couponCode;
  @override
  FutureOr<OrderState?> build() {
    // No initial request
    return null;
  }

  Future<void> createOrder({String? couponCode}) async {
    state = const AsyncLoading();

    try {
      final repo = ref.read(homeRepositoryProvider);
      final driverData = ref.read(userDataProvider.notifier).userinformation;
      final coordinates =
          ref.read(locationSearchControllerProvider.notifier).sendCoordinates();
      final mapService = ref.watch(mapControllerProvider.notifier);
      final serviceType = ref.watch(selectServiceTypeControllerProvider);

      if (coordinates == null) {
        state = AsyncError('Invalid coordinates', StackTrace.current);
        return;
      }
      debugPrint('Address 1: ${mapService.firstPointAddress}');
      debugPrint('Address 2: ${mapService.secondPointAddress}');
      // Step 1: Create the quick order
      final orderResponse = await repo.createQuickOrder(
        email: driverData.email,
        
        passengerCoordinates: 
        // coordinates[0]
        CoordinatesParams(
          lat:coordinates[0].lat,
          lng:coordinates[0].lng,
        address:coordinates[0].address,

          // lat: 40.659569, // Replace with coordinates.lat for actual use
          // lng: -73.933783, // Replace with coordinates.lng for actual use
        // address: "doha",
       
        ),
        destinationCoordinates: 
        // coordinates[1]
        // 
        CoordinatesParams(
          lat:coordinates[1].lat,
          lng:coordinates[1].lng,
        address:coordinates[1].address,

          // lat: 40.659569, // Replace with coordinates.lat for actual use
          // lng: -73.933783, // Replace with coordinates.lng for actual use
        // address: "Wakrah"
        ),
        searviceItemId: serviceType.value!.selectedServiceType!.serviceId,
        couponCode: couponCode,
      );

      final quickOrderId = orderResponse.data?.quickOrderId;

      if (quickOrderId == null ||
          quickOrderId.isEmpty ||
          orderResponse.hasFailed) {
        debugPrint(
            "❌ orderResponse.hasFailed quickOrderId == null OR quickOrderId isEmpty");
        throw Exception(orderResponse.message ?? "No available drivers.");
      }
      debugPrint("quickOrderId is => $quickOrderId");

      final current = state.value;
      state = AsyncData(
        current?.copyWith(orderModel: orderResponse.data) ??
            OrderState(orderModel:  orderResponse.data),
      );
    } catch (e, stackTrace) {
      debugPrint("❌ StackTrace: $stackTrace");

      state = AsyncError(e, stackTrace);
    }
  }
Future<void> startOpenNewOrderSocket(BuildContext context) async {
  // state = const AsyncLoading();

  final socketService = ref.read(socketServiceProvider);
  final driverData = ref.read(userDataProvider.notifier).userinformation;

  final currentOrder = state.value?.orderModel;

  if (currentOrder == null) {
    debugPrint("❌ Unable to Open socket: no order model");
    throw Exception("Unable to Open socket");
  }

  await socketService.connect(driverData.token).then((_)async {
    // ✅ Show truck loading dialog
   await showSearchingTruckLoading(context: context);

    socketService.on(currentOrder.quickOrderId, (data) {
      if (data == null) return;

      debugPrint("🎛️ Received order details: $data");

      final result = QuickOrderDetailsModel.fromJson(data);

      if (result.status == "No Driver Found" ||
          result.driverData?.driverId == null) {
        state = AsyncError("No Driver Found", StackTrace.current);
        return;
      }

      // ✅ Update state
      final current = state.value;
      state = AsyncData(
        current?.copyWith(orderDetails: result) ??
            OrderState(orderDetails: result),
      );

      // ✅ Close loading dialog (if needed)
      Navigator.of(context, rootNavigator: true).pop(); // Close loading

      // ✅ Show driver sheet only once
      Future.microtask(() {
        showDriverDetailsBottomSheet(context);
      });
    });
  });
}

  void setCouponCode(String couponCode) {
    _couponCode = couponCode;
  }
}
