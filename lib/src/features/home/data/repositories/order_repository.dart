import 'package:ahtizam/src/utils/helper_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/order_model.dart';

part 'order_repository.g.dart';

@riverpod
OrderRepository orderRepository(OrderRepositoryRef ref) => OrderRepository();

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final double searchRadiusKm = 10.0;

  // Create a new order
  Future<String> createOrder({
    required GeoPoint pickupLocation,
    required GeoPoint workshopLocation,
    required String truckType,
    required double price,
  }) async {
    try {
      final orderDoc = _firestore.collection('orders').doc();

      final order = OrderModel(
        id: orderDoc.id,
        pickupLocation: pickupLocation,
        workshopLocation: workshopLocation,
        truckType: truckType,
        status: 'pending',
        createdAt: DateTime.now(),
        price: price,
      );

      await orderDoc.set(order.toJson());

      // Start finding nearest driver
      await _findAndNotifyNearestDriver(order);

      return orderDoc.id;
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  // Find nearest available driver
  Future<void> _findAndNotifyNearestDriver(OrderModel order) async {
    try {
      final center = GeoFirePoint(order.pickupLocation);

      final driversCollection = _firestore.collection('drivers');
      final geoDrivers = GeoCollectionReference(driversCollection);

      final nearbyDrivers = await geoDrivers.fetchWithin(
        center: center,
        radiusInKm: searchRadiusKm,
        field: 'location',
        geopointFrom: (data) =>
            (data['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint,
        queryBuilder: (query) => query
            .where('isAvailable', isEqualTo: true)
            .where('isOnline', isEqualTo: true),
      );

      if (nearbyDrivers.isEmpty) {
        throw Exception(
            'No available drivers found within $searchRadiusKm km.');
      }

      nearbyDrivers.sort((a, b) {
        final aLoc =
            (a['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint;
        final bLoc =
            (b['location'] as Map<String, dynamic>)['geopoint'] as GeoPoint;

        final aDist = calculateDistanceKm(center.geopoint, aLoc);
        final bDist = calculateDistanceKm(center.geopoint, bLoc);
        return aDist.compareTo(bDist);
      });

      final nearestDriver = nearbyDrivers.first;

      await _sendOrderToDriver(order.id, nearestDriver.id);

      // Optionally: update the order with assigned driver
      await _firestore.collection('orders').doc(order.id).update({
        'assignedDriverId': nearestDriver.id,
      });
    } catch (e) {
      throw Exception('Failed to find nearest driver: $e');
    }
  }

  // Send order to a driver
  Future<void> _sendOrderToDriver(String orderId, String driverId) async {
    try {
      await _firestore.collection('driver_orders').add({
        'orderId': orderId,
        'driverId': driverId,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to send order to driver: $e');
    }
  }

  // Watch order in real-time
  Stream<OrderModel> watchOrder(String orderId) {
    return _firestore
        .collection('orders')
        .doc(orderId)
        .snapshots()
        .map((doc) => OrderModel.fromJson(doc.data()!));
  }
}
