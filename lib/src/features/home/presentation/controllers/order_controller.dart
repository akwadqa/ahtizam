import 'package:ahtizam/src/utils/helper_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/order_repository.dart';
import '../../domain/models/order_model.dart';

part 'order_controller.g.dart';

final orderRepositoryProvider = Provider((ref) => OrderRepository());

@riverpod
class OrderController extends _$OrderController {
  late final OrderRepository _repository;

  @override
  FutureOr<OrderModel?> build() {
    _repository = ref.watch(orderRepositoryProvider);
    return null;
  }

  Future<void> createOrder({
    required double pickupLat,
    required double pickupLng,
    required double workshopLat,
    required double workshopLng,
    required String truckType,
    required double price,
  }) async {
    try {
      state = const AsyncValue.loading();

      // Check Firestore connection first
      // try {
      //   await FirebaseFirestore.instance.terminate();
      //   await FirebaseFirestore.instance.enableNetwork();
      // } catch (e) {
      //   print('Error resetting Firestore connection: $e');
      // }

      // Validate coordinates
      if (!isValidCoordinate(pickupLat, pickupLng) ||
          !isValidCoordinate(workshopLat, workshopLng)) {
        throw Exception('Invalid coordinates provided');
      }

      final pickupGeo = GeoPoint(pickupLat, pickupLng);
      final workshopGeo = GeoPoint(workshopLat, workshopLng);

      // First verify we can read from Firestore
      try {
        final testRead = await FirebaseFirestore.instance
            .collection('drivers').doc("test_driver").parent
            .limit(1)
            .get();
        print('Test read successful. Found ${testRead.docs.length} documents');
      } catch (e) {
        print('Error testing Firestore read: $e');
        throw Exception(
            'Unable to connect to Firestore. Please check your internet connection and try again.');
      }

      final orderDoc = FirebaseFirestore.instance.collection('orders').doc();

      // Create GeoFirePoint for pickup location
      final pickupPoint = GeoFirePoint(pickupGeo);

      final order = OrderModel(
        id: orderDoc.id,
        pickupLocation: pickupGeo,
        workshopLocation: workshopGeo,
        truckType: truckType,
        status: 'pending',
        createdAt: DateTime.now(),
        price: price,
      );

      // Save order data with retry
      await retryOperation(() => orderDoc.set(order.toJson()));

      // First, try to get all drivers to debug
      final driversSnapshot =
          await FirebaseFirestore.instance.collection('drivers').get();

      print('Found ${driversSnapshot.docs.length} total drivers');

      for (var doc in driversSnapshot.docs) {
        print('Driver ${doc.id}: ${doc.data()}');
      }

      // Geo query to find nearby drivers
      final CollectionReference<Map<String, dynamic>> driversRef =
          FirebaseFirestore.instance.collection('drivers');

      final geoCollection = GeoCollectionReference(driversRef);

      // Query for drivers within 10km radius with retry
      final List<DocumentSnapshot<Map<String, dynamic>>> drivers =
          await retryOperation(() => geoCollection
              .fetchWithin(
                center: pickupPoint,
                radiusInKm: 10,
                field: 'location',
                geopointFrom: (data) {
                  try {
                    final location = data['location'];
                    if (location is Map<String, dynamic>) {
                      final geopoint = location['geopoint'];
                      if (geopoint is GeoPoint) {
                        return geopoint;
                      }
                    }
                    print('Invalid location format for driver: $data');
                    return location;
                  } catch (e) {
                    print('Error extracting geopoint: $e');
                    throw e;
                  }
                },
                queryBuilder: (query) => query
                    .where('isAvailable', isEqualTo: true)
                    .where('isOnline', isEqualTo: true),
              )
              .then((drivers) => drivers.where((d) => d != null).toList()));

      print('Found ${drivers.length} nearby drivers');

      if (drivers.isEmpty) {
        // Update order status to indicate no drivers found
        await retryOperation(() => orderDoc.update({
              'status': 'no_drivers',
              'error': 'No available drivers found within 10km radius'
            }));
        throw Exception(
            'No available drivers found within 10km radius. Please try again later.');
      }

      // Sort by real-world distance
      drivers.sort((a, b) {
        final aLoc = (a.data()!['location'] as Map<String, dynamic>)['geopoint']
            as GeoPoint;
        final bLoc = (b.data()!['location'] as Map<String, dynamic>)['geopoint']
            as GeoPoint;

        final aDist = calculateDistanceKm(pickupGeo, aLoc);
        final bDist = calculateDistanceKm(pickupGeo, bLoc);

        return aDist.compareTo(bDist);
      });

      final nearestDriver = drivers.first;

      // Assign driver with retry
      await retryOperation(
          () => FirebaseFirestore.instance.collection('driver_orders').add({
                'orderId': order.id,
                'driverId': nearestDriver.id,
                'status': 'pending',
                'createdAt': FieldValue.serverTimestamp(),
              }));

      await retryOperation(() => orderDoc.update(
          {'assignedDriverId': nearestDriver.id, 'status': 'driver_assigned'}));

      // Start listening to order status changes
      FirebaseFirestore.instance
          .collection('orders')
          .doc(order.id)
          .snapshots()
          .listen((doc) {
        if (doc.exists) {
          state = AsyncValue.data(OrderModel.fromJson(doc.data()!));
        }
      }, onError: (e, stack) {
        print('Error listening to order updates: $e');
        state = AsyncValue.error(e, stack);
      });
    } catch (e, stack) {
      print('Error creating order: $e');
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  bool isValidCoordinate(double lat, double lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }
}
