import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../application/map_service.dart';

part 'location_search_controller.g.dart';

@riverpod
class LocationSearchController extends _$LocationSearchController {
  @override
  Map<String, List<Prediction>> build() {
    return {};
  }

  final TextEditingController myLocationController = TextEditingController();
  final TextEditingController workShopLocationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
}
