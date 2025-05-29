import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';
import 'package:ahtizam/src/features/home/domain/models/passenger_coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/location_searching_controller/location_search_controller.dart';

part 'quick_order_controller.g.dart';

@riverpod
class QuickOrderController extends _$QuickOrderController {
  @override
  FutureOr<QuickOrderDetailsModel?> build() {
    // No initial request
    return null;
  }

  Future<void> createOrder() async {
    state = const AsyncLoading();

    final coordinates = ref
        .read(locationSearchControllerProvider.notifier)
        .sendCoordinates();

    if (coordinates == null) {
      state = AsyncError('Invalid coordinates', StackTrace.current);
      return;
    }

    try {
      final repo = ref.read(homeRepositoryProvider);
      final driverData = ref.read(userDataProvider.notifier).userinformation;

      // Step 1: Create the quick order
      final orderResponse = await repo.createQuickOrder(
        email: driverData.email,
        coordinates: PassengerCoordinatesParams(
          // lat:coordinates.lat, 
          // lng:coordinates.lng, 
          lat: 40.659569, // Replace with coordinates.lat for actual use
          lng: -73.933783, // Replace with coordinates.lng for actual use
        ),
      );

      final quickOrderId = orderResponse.data?.quickOrderId;

      if (quickOrderId == null || quickOrderId.isEmpty) {
        throw Exception(orderResponse.message ?? "No available drivers.");
      }

      final socketService = ref.read(socketServiceProvider);

      // Step 2: Connect to socket and listen for order details
      await socketService.connect(driverData.token).then((_) {
        socketService.on(quickOrderId, (data) {
          if (data != null) {
            debugPrint("🎛️ Received order details: $data");
            final result = QuickOrderDetailsModel.fromJson(
              data as Map<String, dynamic>,
            );
               if (result.status == "No Driver Found"||result.driverData?.driverId==null) {
              state = AsyncError("No Driver Found", StackTrace.current);
              return;
            }
            state = AsyncData(result);
          }
        });
      });
    } catch (e, stackTrace) {
            debugPrint("❌ StackTrace: $stackTrace");

      state = AsyncError(e, stackTrace);
    }
  }
}
