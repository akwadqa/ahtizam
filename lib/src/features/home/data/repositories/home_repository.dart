import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/home/data/datasources/home_data_source.dart';
import 'package:ahtizam/src/features/home/domain/models/passenger_coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return HomeRepository(HomeRemoteDataSource(networkService));
}

class HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);

  // Create a new order
  Future<ApiResponse<QuickOrderModel>> createQuickOrder({
    required PassengerCoordinatesParams coordinates,
    required String email,
  }) async {
    try {
      final result = await _remoteDataSource.createQuickOrder(coordinates,email);
      // Start finding nearest driver
      // await _findAndNotifyNearestDriver(order);

      if (result.status == 200) {
        return result;
      } else {
        return ApiResponse<QuickOrderModel>.error(
            message: result.message ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  Future<ApiResponse<QuickOrderDetailsModel>> getQuickOrderDetails({
    required String quickOrderId,
  }) async {
    try {
      final result = await _remoteDataSource.getQuickOrderDetails(quickOrderId);

      if (result.status == 200) {
        return result;
      } else {
        return ApiResponse<QuickOrderDetailsModel>.error(
            message: result.message ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Failed to Get order details: $e');
    }
  }

  // // Find nearest available driver
  // Future<void> _findAndNotifyNearestDriver(OrderModel order) async {
  //   try {
  //     final center = GeoFirePoint(order.pickupLocation);

  //     final driversCollection = _firestore.collection('drivers');
  //     final geoDrivers = GeoCollectionReference(driversCollection);

  //     final nearbyDrivers = await geoDrivers.fetchWithin(
  //       center: center,
  //       radiusInKm: searchRadiusKm,
  //       field: 'location',
  //       geopointFrom: (data) =>
  //           (data['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint,
  //       queryBuilder: (query) => query
  //           .where('isAvailable', isEqualTo: true)
  //           .where('isOnline', isEqualTo: true),
  //     );

  //     if (nearbyDrivers.isEmpty) {
  //       throw Exception(
  //           'No available drivers found within $searchRadiusKm km.');
  //     }

  //     nearbyDrivers.sort((a, b) {
  //       final aLoc =
  //           (a['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint;
  //       final bLoc =
  //           (b['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint;

  //       final aDist = calculateDistanceKm(center.geopoint, aLoc);
  //       final bDist = calculateDistanceKm(center.geopoint, bLoc);
  //       return aDist.compareTo(bDist);
  //     });

  //     final nearestDriver = nearbyDrivers.first;

  //     await _sendOrderToDriver(order.id, nearestDriver.id);

  //     // Optionally: update the order with assigned driver
  //     await _firestore.collection('orders').doc(order.id).update({
  //       'assignedDriverId': nearestDriver.id,
  //     });
  //   } catch (e) {
  //     throw Exception('Failed to find nearest driver: $e');
  //   }
  // }

  // // Send order to a driver
  // Future<void> _sendOrderToDriver(String orderId, String driverId) async {
  //   try {
  //     await _firestore.collection('driver_orders').add({
  //       'orderId': orderId,
  //       'driverId': driverId,
  //       'status': 'pending',
  //       'createdAt': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     throw Exception('Failed to send order to driver: $e');
  //   }
  // }

  // // Watch order in real-time
  // Stream<OrderModel> watchOrder(String orderId) {
  //   return _firestore
  //       .collection('orders')
  //       .doc(orderId)
  //       .snapshots()
  //       .map((doc) => OrderModel.fromJson(doc.data()!));
  // }
}
