import 'dart:io';
import 'dart:math';

import 'package:ahtizam/src/routing/app_router_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

import '../../../constants/Api/services_urls.dart';
import 'package:path_provider/path_provider.dart';

part 'map_service.g.dart';


@riverpod
Future<bool> locationPermission(Ref ref) async {
  PermissionStatus permission = await Permission.location.request();
  if (permission.isGranted) {
    return true;
  }

  // 1) Ensure services are ON
  final servicesOn = await Geolocator.isLocationServiceEnabled();
  if (!servicesOn) {
    // Optionally guide user:
    // await Geolocator.openLocationSettings();
    return false;
  }

  // 2) Check permission
  var perm = await Geolocator.checkPermission();

  // 3) Request once if denied
  if (perm == LocationPermission.denied) {
    perm = await Geolocator.requestPermission();
  }

  // 4) If denied forever, you must send user to Settings
  if (perm == LocationPermission.deniedForever) {
    // Optional: show a dialog then:
    // await openAppSettings(); // from permission_handler
    return false;
  }

  // 5) iOS 14+: ask for precise accuracy if we only have reduced
  try {
    final acc = await Geolocator.getLocationAccuracy();
    if (acc == LocationAccuracyStatus.reduced) {
      // The key "NavigationUsage" must exist in Info.plist (you already added it)
      await Geolocator.requestTemporaryFullAccuracy(
        purposeKey: 'NavigationUsage',
      );
      // ignore any failures; we can still get a coarse fix
    }
  } catch (_) {}

  // 6) Final check
  return perm == LocationPermission.whileInUse ||
      perm == LocationPermission.always;
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
  bool orderActive = false;

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
          await mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: latLng, zoom: 17),
            ),
          );
        } catch (e) {
          debugPrint("⚠️ animateCamera failed: $e");
          // Still return location even if animation failed
        }
      } else {
        debugPrint("⚠️ mapController is null, skipping camera animation");
      }
      if (firstPoint != latLng) {
        firstPoint = latLng;
      }

      firstPointAddress = await _getAddressFromLatLng(latLng);
      return latLng;
    } catch (e) {
      debugPrint("❌ Error fetching location: $e");
      return null;
    }
  }

  /// **Manually update location**
  Future<void> updateLocation({bool enableLoading = false}) async {
    if (enableLoading) {
      state = const AsyncValue.loading();
    }
    state = await AsyncValue.guard(() async => await _fetchCurrentLocation());
  }

  Future<String?> _getAddressFromLatLng(LatLng latLng) async {
    try {
      debugPrint("📍1 latLng: ${latLng.latitude}");

      final response = await geocoding.reverse(
        '${latLng.latitude},${latLng.longitude}',
      );
      debugPrint("📍2 latLng: ${latLng.longitude}");

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
    // final mySearchontroller = ref
    //     .read(locationSearchControllerProvider.notifier)
    //     .myLocationController;
    // debugPrint("kokokokokk${mySearchontroller.text}");
    if (firstPointAddress!=null&&firstPointAddress!.isEmpty) {
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

Future<void> resetPoints() async {
  // Clear points and addresses
  firstPoint = null;
  secondPoint = null;
  driverPoint = null;
  isFirstPointSelected = false;
  polylineCoordinates.clear();
  firstPointAddress = null;
  secondPointAddress = null;

  // Reset internal flags
  orderActive = false;

  // Clear map overlays visually
  if (mapController != null) {
    await mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: LatLng(0, 0), zoom: 1),
      ),
    );
  }

  // Refresh state to rebuild the UI
  // state = const AsyncData(null);
  ref.invalidateSelf();

  // Optionally re-fetch current location after clearing
  final newLoc = await _fetchCurrentLocation();
  if (newLoc != null) {
    firstPoint = newLoc;
    firstPointAddress = await _getAddressFromLatLng(newLoc);
    state = AsyncData(newLoc);
  }
}


  void changeOrderActiveStatus() {
    orderActive = !orderActive;
    debugPrint("Order active status changed to: $orderActive");
  }

  Future<void> getPolylinePoints({
    bool fromUserToSource = true,
    bool fromDriverToUser = false,
  }) async {
    if (firstPoint == null || secondPoint == null) return;
    debugPrint("📍 First polyline 📍: ${firstPoint?.latitude ?? "none"}");
    debugPrint("📍 second polyline 📍: ${secondPoint?.latitude ?? "none"}");
    final LatLng? fromPoint = fromUserToSource ? firstPoint : driverPoint;
    final LatLng? toPoint = fromDriverToUser ? firstPoint : secondPoint;
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ServicesUrls.mapApiKey,
      PointLatLng(fromPoint!.latitude, fromPoint.longitude),
      PointLatLng(toPoint!.latitude, toPoint.longitude),
      travelMode: TravelMode.driving,
    );
    moveCameraToIncludeRoute(
      fromDriverToUser: fromDriverToUser,
      fromUserToSource: fromUserToSource,
    );
    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      debugPrint("✅ Polyline fetched: ${polylineCoordinates.length} points");
      // final locationType=fromUserToSource?firstPoint:driverPoint;
      state = AsyncValue.data(fromPoint);
    } else {
      debugPrint("❌ Failed to fetch polyline: ${result.errorMessage}");
    }
  }

  void changeUserLocation() {
    firstPoint = driverPoint;
    // polylineCoordinates.clear();
    state = AsyncValue.data(firstPoint);
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

  Future<void> updateDriverLocation(
    LatLng latLng, {
    bool orderActiveted = false,
  }) async {
    debugPrint("📍 Driver point: ${latLng.latitude}, ${latLng.longitude}");
    driverPoint = latLng;

    // Ensure mapController and points are ready
    if (mapController == null || firstPoint == null || secondPoint == null) {
      debugPrint("🛑 Map or points not ready");
      return;
    }

    try {
      if (orderActive == false) {
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
        await mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
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

  Future<void> moveCameraToIncludeRoute({
    bool fromUserToSource = true,
    bool fromDriverToUser = false,
  }) async {
    if (mapController == null || firstPoint == null || secondPoint == null) {
      return;
    }
    final LatLng? fromPoint = fromUserToSource ? firstPoint : driverPoint;
    final LatLng? toPoint = fromDriverToUser ? firstPoint : secondPoint;
    // Ensure the bounds are valid by calculating min/max
    final southwest = LatLng(
      min(fromPoint!.latitude, toPoint!.latitude),
      min(fromPoint.longitude, toPoint.longitude),
    );

    final northeast = LatLng(
      max(fromPoint.latitude, toPoint.latitude),
      max(fromPoint.longitude, toPoint.longitude),
    );
    final router = ref.watch(appRouterProvider);
    final bounds = LatLngBounds(southwest: southwest, northeast: northeast);
    final screenHeight = router.navigatorKey.currentContext == null
        ? 740
        : MediaQuery.of(router.navigatorKey.currentContext!).size.height;
    final top = 100.0;
    final bottom = 150.0 + 300;

    final visibleHeight = screenHeight - (top + bottom);
    final dynamicPadding = visibleHeight * 0.05;

    final cameraUpdate = CameraUpdate.newLatLngBounds(bounds, dynamicPadding);
    try {
      await mapController?.animateCamera(cameraUpdate);
    } catch (e) {
      debugPrint("❌ Camera animation failed: $e");

      // Workaround for known Android bounds crash bug
      await Future.delayed(const Duration(milliseconds: 300));
      await mapController?.moveCamera(cameraUpdate);
    }
  }



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
