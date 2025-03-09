import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_service.g.dart';

/// **Request location permission**
@riverpod
Future<bool> locationPermission(Ref ref) async {
  PermissionStatus permission = await Permission.location.request();
  return permission.isGranted;
}

/// **Provide the current location (LatLng)**
@Riverpod(keepAlive: true)
class MapProvider extends _$MapProvider {
  @override
  FutureOr<LatLng?> build() async {
    final hasPermission = await ref.watch(locationPermissionProvider.future);

    if (!hasPermission) {
      debugPrint("Location permission denied.");
      return null;
    }

    return await _fetchCurrentLocation();
  }

  /// **Fetch current location**
  Future<LatLng?> _fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      debugPrint("Error fetching location: $e");
      return null;
    }
  }

  /// **Manually update location**
  Future<void> updateLocation() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchCurrentLocation());
  }
}
