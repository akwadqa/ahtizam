import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

import '../../../constants/Api/services_urls.dart';
import '../presentation/controllers/location_searching_controller/location_search_controller.dart';

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
  String? currentAddress;
  String? firstPointAddress;
  String? secondPointAddress;

  @override
  FutureOr<LatLng?> build() async {
    final hasPermission = await ref.watch(locationPermissionProvider.future);

    if (!hasPermission) {
      debugPrint("Location permission denied.");
      return null;
    }
    final latLng = await _fetchCurrentLocation();

    return latLng;
  }

  /// **Fetch current location**
  Future<LatLng?> _fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      debugPrint("LAT location: ${position.latitude}");
      debugPrint("LONG location: ${position.longitude}");

      LatLng latLng = LatLng(position.latitude, position.longitude);
      await mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 17,
        ),
      ));
      firstPoint = latLng;
      debugPrint("📍 First point : $firstPoint");

      firstPointAddress = await _getAddressFromLatLng(latLng);

      return latLng;
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
    final mySearchontroller = ref
        .read(locationSearchControllerProvider.notifier)
        .myLocationController;
    if (mySearchontroller.text.isEmpty) {
      firstPoint = latLng;
      isFirstPointSelected = true;
      firstPointAddress = await _getAddressFromLatLng(latLng);
      state = AsyncValue.data(latLng);
      debugPrint("📍 First point (from search): $firstPointAddress");
    } else {
      secondPoint = latLng;
      secondPointAddress = await _getAddressFromLatLng(latLng);
      state = AsyncValue.data(latLng);
      debugPrint("Second point address: $secondPointAddress");
      await getPolylinePoints();
    }
    debugPrint("📌 Selected location: ${latLng.latitude}, ${latLng.longitude}");
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

  Future<void> getPolylinePoints() async {
    // if (firstPoint == null || secondPoint == null) return;
    debugPrint("❌ First polyline: ${firstPoint?.latitude ?? "nukk"}");
    debugPrint("❌ second polyline: ${secondPoint?.latitude ?? "nukki"}");

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
