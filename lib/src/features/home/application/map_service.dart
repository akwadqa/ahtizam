import 'dart:io';
import 'dart:math';
import 'dart:ui';

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
import 'package:path_provider/path_provider.dart';

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
  File? mapScreenshotFile;

  GoogleMapController? mapController;
  LatLng? firstPoint;
  LatLng? secondPoint;
  LatLng? driverPoint;
  bool isFirstPointSelected = false;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final geocoding = GoogleGeocodingApi(ServicesUrls.mapApiKey);
  String? currentAddress;
  String? firstPointAddress;
  String? secondPointAddress;
  bool _isMapReady = false; // Add this flag
  bool orderActive=false;

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
      debugPrint("🟠 Fetching current location...");
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      debugPrint("✅ Got location: ${position.latitude}, ${position.longitude}");

      LatLng latLng = LatLng(position.latitude, position.longitude);

      // Only animate camera if controller is ready
      if (mapController != null) {
        try {
          await mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 17),
          ));
        } catch (e) {
          debugPrint("⚠️ animateCamera failed: $e");
          // Still return location even if animation failed
        }
      } else {
        debugPrint("⚠️ mapController is null, skipping camera animation");
      }

      firstPoint = latLng;
      firstPointAddress = await _getAddressFromLatLng(latLng);
      return latLng;
    } catch (e) {
      debugPrint("❌ Error fetching location: $e");
      return null;
    }
  }

  /// **Manually update location**
  Future<void> updateLocation() async {
    state = const AsyncValue.loading();
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
    _isMapReady = true;
    _refreshState();
    // state = AsyncValue.data(mapController?.cameraPosition.target);
  }

  void resetPoints() {
    firstPoint = null;
    secondPoint = null;
    driverPoint = null;
    isFirstPointSelected = false;
    polylineCoordinates = [];
    firstPointAddress = null;
    secondPointAddress = null;
  }
  void changeOrderActiveStatus(){
    orderActive=!orderActive;
    debugPrint("Order active status changed to: $orderActive");
  }

  Future<void> getPolylinePoints() async {
    // if (firstPoint == null || secondPoint == null) return;
    debugPrint("📍 First polyline 📍: ${firstPoint?.latitude ?? "nukk"}");
    debugPrint("📍 second polyline 📍: ${secondPoint?.latitude ?? "nukki"}");

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


  Future<void> getPolylineDriverToMePoints() async {
    // if (firstPoint == null || secondPoint == null) return;
    debugPrint("📍 First polyline 📍: ${driverPoint?.latitude ?? "UNKNOWN"}");
    debugPrint("📍 second polyline 📍: ${firstPoint?.latitude ?? "UNKNOWN"}");

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ServicesUrls.mapApiKey,
      PointLatLng(driverPoint!.latitude, driverPoint!.longitude),
      PointLatLng(firstPoint!.latitude, firstPoint!.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      debugPrint("✅ Polyline fetched: ${polylineCoordinates.length} points");
      state = AsyncValue.data(firstPoint!);
    } else {
      debugPrint("❌ Failed to fetch polyline: ${result.errorMessage}");
    }
  }

  bool get isReady => mapController != null && _isMapReady;

  Future<void> safeAnimateCamera(CameraUpdate update) async {
    if (!isReady) {
      debugPrint("⚠️ Map not ready");
      return;
    }

    try {
      await Future.delayed(Duration(milliseconds: 150));
      await mapController!.animateCamera(update);
      debugPrint("✅ Camera animated");
    } catch (e) {
      debugPrint("❌ animateCamera failed: $e");

      try {
        await mapController!.moveCamera(update);
        debugPrint("✅ moveCamera fallback success");
      } catch (fallback) {
        debugPrint("❌ Fallback failed: $fallback");
      }
    }
  }

  // Future<void> updateDriverLocation(LatLng latLng) async {
  //   debugPrint("📍 Driver point: ${latLng.latitude}, ${latLng.longitude}");
  //   driverPoint = latLng;

  //   // Ensure everything is ready
  //   if (!_isMapReady || mapController == null) {
  //     debugPrint("🛑 Map not ready for driver location update");
  //     _refreshState();
  //     return;
  //   }

  //   // Simple approach: just center on driver location
  //   // await safeAnimateCamera(CameraUpdate.newCameraPosition(
  //   //   CameraPosition(target: latLng, zoom: 17),
  //   // ));

  //   _refreshState();
  // }

  void _refreshState() {
    state = AsyncValue.data(firstPoint ?? driverPoint ?? const LatLng(0, 0));
  }

// Future<void> safeAnimateCamera(CameraUpdate update) async {
//   if (mapController == null) return;

//   try {
//     await mapController!.animateCamera(update);
//   } catch (e) {
//     debugPrint("❌ Camera animation failed: $e");
//   }
// }

  Future<void> updateDriverLocation(LatLng latLng) async {
    debugPrint("📍 Driver point: ${latLng.latitude}, ${latLng.longitude}");
    driverPoint = latLng;

    // Ensure mapController and points are ready
    if (mapController == null || firstPoint == null || secondPoint == null) {
      debugPrint("🛑 Map or points not ready");
      return;
    }

    try {
      if(orderActive==false) {
        changeOrderActiveStatus();
      }
      // final allLatLngs = [driverPoint!, firstPoint!, secondPoint!];

      // final southWest = LatLng(
      //   allLatLngs.map((p) => p.latitude).reduce((a, b) => a < b ? a : b),
      //   allLatLngs.map((p) => p.longitude).reduce((a, b) => a < b ? a : b),
      // );

      // final northEast = LatLng(
      //   allLatLngs.map((p) => p.latitude).reduce((a, b) => a > b ? a : b),
      //   allLatLngs.map((p) => p.longitude).reduce((a, b) => a > b ? a : b),
      // );

      // final bounds = LatLngBounds(southwest: southWest, northeast: northEast);

      // ✅ Delay to ensure map is rendered before animating
      await Future.delayed(Duration(milliseconds: 500));

      if (mapController != null) {
        await mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 17),
        ));
        // await mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 80));
      } else {
        debugPrint("❌ mapController is null during animation");
      }
    } catch (e) {
      debugPrint("❌ Camera animation failed: $e");
    }

    _refreshState();
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
      saveMapScreenshot(imageBytes);
      debugPrint("✅ Screenshot Captured & Saved!");
    } else {
      debugPrint("❌ Screenshot Failed: ImageBytes is null");
    }
  }
Future<void> moveCameraToIncludeRoute() async {
  if (mapController == null || firstPoint == null || secondPoint == null) return;

  // Ensure the bounds are valid by calculating min/max
  final southwest = LatLng(
    min(firstPoint!.latitude, secondPoint!.latitude),
    min(firstPoint!.longitude, secondPoint!.longitude),
  );

  final northeast = LatLng(
    max(firstPoint!.latitude, secondPoint!.latitude),
    max(firstPoint!.longitude, secondPoint!.longitude),
  );

  final bounds = LatLngBounds(southwest: southwest, northeast: northeast);
  final cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 80); 

  try {
    await mapController!.animateCamera(cameraUpdate);
  } catch (e) {
    debugPrint("❌ Camera animation failed: $e");

    // Workaround for known Android bounds crash bug
    await Future.delayed(const Duration(milliseconds: 300));
    await mapController!.moveCamera(cameraUpdate);
  }
}

//   Future<void> captureAndResizeScreenshot({int targetWidth = 1080, int targetHeight = 200}) async {
//   if (mapController == null) return;

//   final originalImageBytes = await mapController!.takeSnapshot();
//   if (originalImageBytes == null) return;

//   final codec = await instantiateImageCodec(
//     originalImageBytes,
//     targetWidth: targetWidth,
//     targetHeight: targetHeight,
//   );
//   final frame = await codec.getNextFrame();
//   final resized = await frame.image.toByteData(format: ImageByteFormat.png);

//   if (resized != null) {
//     final resizedBytes = resized.buffer.asUint8List();
//     cachedMapScreenshot = resizedBytes;
//     saveMapScreenshot(resizedBytes);
//   }
// }


  Future<void> saveMapScreenshot(Uint8List imageBytes) async {
    try {
      final directory = await getTemporaryDirectory();
      final path =
          '${directory.path}/map_screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(path);
      await file.writeAsBytes(imageBytes);
      mapScreenshotFile = file;
      debugPrint("📁 Screenshot saved at: $path");
    } catch (e) {
      debugPrint("❌ Failed to save screenshot: $e");
    }
  }

  Uint8List? getMapScreenshot() {
    return cachedMapScreenshot;
  }
}
