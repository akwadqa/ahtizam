import 'package:ahtizam/src/features/home/domain/models/passenger_coordinates_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../application/map_service.dart';

part 'location_search_controller.g.dart';

@riverpod
class LocationSearchController extends _$LocationSearchController {
  final TextEditingController myLocationController = TextEditingController();
  final TextEditingController workShopLocationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Map<String, List<Prediction>> build() {
    final mapController = ref.read(mapControllerProvider.notifier);
    myLocationController.text = mapController.firstPointAddress ?? '';

    // ref.listen<AsyncValue<LatLng?>>(
    //   mapControllerProvider,
    //   (previous, next) {
    //     final map = ref.read(mapControllerProvider.notifier);
    //     final address = map.firstPointAddress;

    //     if (address != null && address.isNotEmpty) {
    //       myLocationController.text = address;
    //       debugPrint("✅ My Location auto-filled: $address");
    //     }
    //   },
    // );
    return {};
  }

  void updatePredictions(String fieldId, List<Prediction> predictions) {
    state = {
      ...state,
      fieldId: predictions,
    };
  }

  // Clear predictions for a specific field
  void clearPredictions(String fieldId) {
    final newState = {...state};
    newState.remove(fieldId);
    state = newState;
  }

  // Update location from map selection
  void updateLocationFromMap() {
    final mapController = ref.read(mapControllerProvider.notifier);
    // final newState = {...state};
    if (mapController.firstPointAddress != null) {
      myLocationController.text = mapController.firstPointAddress!;
      debugPrint("Updated My Location: ${myLocationController.text}");
      // state = newState;
    }
    if (mapController.secondPointAddress != null) {
      workShopLocationController.text = mapController.secondPointAddress!;
      debugPrint(
          "Updated Workshop Location: ${workShopLocationController.text}");
      // state = newState;
    }
  }

  void onMyLocationChanged(String value) async {
    final mapController = ref.read(mapControllerProvider.notifier);
    if (value.isEmpty) return;

    final geocoding = mapController.geocoding;
    final response = await geocoding.search(value);

    if (response.results.isNotEmpty) {
      final location = response.results.first.geometry!.location;
      final latLng = LatLng(location.lat, location.lng);

      // تحديث النقطة الأولى
      mapController.firstPoint = latLng;
      mapController.firstPointAddress =
          response.results.first.mapToPretty().address;
      myLocationController.text = mapController.firstPointAddress!;

      // إعادة رسم المسار إن وُجدت النقطة الثانية

      await mapController.getPolylinePoints();
      await mapController.mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 17,
        ),
      ));
      debugPrint("📍 Updated First Point: ${mapController.firstPointAddress}");
    }
  }

  void onWorkshopLocationChanged(String value) async {
    final mapController = ref.read(mapControllerProvider.notifier);
    if (value.isEmpty) return;

    final geocoding = mapController.geocoding;
    final response = await geocoding.search(value);

    if (response.results.isNotEmpty) {
      final location = response.results.first.geometry!.location;
      final latLng = LatLng(location.lat, location.lng);

      // تحديث النقطة الثانية
      mapController.secondPoint = latLng;
      mapController.secondPointAddress =
          response.results.first.mapToPretty().address;
      workShopLocationController.text = mapController.secondPointAddress!;

      // إعادة رسم المسار إن وُجدت النقطة الأولى
      await mapController.mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 17,
        ),
      ));
      await mapController.getPolylinePoints();

      debugPrint(
          "📍 Updated Second Point: ${mapController.secondPointAddress}");
    }
  }


PassengerCoordinatesParams? sendCoordinates() {
  final mapController = ref.read(mapControllerProvider.notifier);

  final LatLng? userLocation = mapController.firstPoint;
  final LatLng? workshopLocation = mapController.secondPoint;

  if (userLocation == null || workshopLocation == null) {
    debugPrint("🚫 One or both coordinates are missing.");
    // Show a snackbar or dialog to inform user
    return null;
  }

  final data = {
    "user_lat": userLocation.latitude,
    "user_lng": userLocation.longitude,
    "workshop_lat": workshopLocation.latitude,
    "workshop_lng": workshopLocation.longitude,
  };

  // You can send `data` via an API call or pass it to another part of the app
  debugPrint("📤 Sending coordinates: $data");
return PassengerCoordinatesParams(lat: userLocation.latitude, lng: userLocation.longitude);
  // Example: pass to your API service
  // ref.read(yourApiServiceProvider).sendCoordinates(data);
}

}
