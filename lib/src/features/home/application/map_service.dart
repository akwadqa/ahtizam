import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

import '../../../constants/Api/services_urls.dart';

part 'map_service.g.dart';

/// **Request location permission**
@riverpod
Future<bool> locationPermission(Ref ref) async {
  PermissionStatus permission = await Permission.location.request();
  return permission.isGranted;
}

/// **Provide the current location (LatLng)**
@Riverpod(keepAlive: true)
class MapController extends _$MapController {
  Uint8List? cachedMapScreenshot;
  GoogleMapController? mapController;
  LatLng? firstPoint;
  LatLng? secondPoint;
  bool isFirstPointSelected = false;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final geocoding = GoogleGeocodingApi(ServicesUrls.mapApiKey);
  String? firstPointAddress;
  String? secondPointAddress;

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
      debugPrint("LAT location: ${position.latitude}");
      debugPrint("LONG location: ${position.longitude}");

      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      debugPrint("Error fetching location: $e");
      return null;
    }
  }

  /// **Manually update location**
  Future<void> updateLocation() async {
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetchCurrentLocation());
  }

  Future<String?> _getAddressFromLatLng(LatLng latLng) async {
    try {
      final response = await geocoding.reverse(
        '${latLng.latitude},${latLng.longitude}',
      );

      if (response.results.isNotEmpty) {
        final address = response.results.first.mapToPretty();
        debugPrint("📍 Address: ${address.address}");
        return address.address;
      } else {
        debugPrint("❌ No address found.");
        return null;
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
      return null;
    }
  }

  Future<void> setCurrentLocation(LatLng latLng) async {
    if (!isFirstPointSelected) {
      firstPoint = latLng;
      isFirstPointSelected = true;
      firstPointAddress = await _getAddressFromLatLng(latLng);
      state = AsyncValue.data(latLng);
      debugPrint("First point address: $firstPointAddress");
    } else {
      secondPoint = latLng;
      secondPointAddress = await _getAddressFromLatLng(latLng);
      state = AsyncValue.data(latLng);
      debugPrint("Second point address: $secondPointAddress");
      await _getPolylinePoints();
    }
    debugPrint("Updated Location: ${latLng.latitude}, ${latLng.longitude}");
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void resetPoints() {
    firstPoint = null;
    secondPoint = null;
    isFirstPointSelected = false;
    polylineCoordinates = [];
    firstPointAddress = null;
    secondPointAddress = null;
  }

  Future<void> _getPolylinePoints() async {
    if (firstPoint == null || secondPoint == null) return;

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ServicesUrls.mapApiKey,
      PointLatLng(firstPoint!.latitude, firstPoint!.longitude),
      PointLatLng(secondPoint!.latitude, secondPoint!.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      debugPrint("✅ Polyline fetched: ${polylineCoordinates.length} points");
      state = AsyncValue.data(secondPoint!);
    } else {
      debugPrint("❌ Failed to fetch polyline: ${result.errorMessage}");
    }
  }

  /// **Capture Screenshot and Save it**
  Future<void> captureScreenshot() async {
    if (mapController == null) {
      debugPrint("⏳ Waiting for map controller...");
      return;
    }

    final imageBytes = await mapController!.takeSnapshot();
    if (imageBytes != null) {
      cachedMapScreenshot = imageBytes;
      debugPrint("✅ Screenshot Captured & Saved!");
    } else {
      debugPrint("❌ Screenshot Failed: ImageBytes is null");
    }
  }

  void saveMapScreenshot(Uint8List image) {
    cachedMapScreenshot = image;
  }

  Uint8List? getMapScreenshot() {
    return cachedMapScreenshot;
  }
}
