import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_search_controller.g.dart';

@riverpod
class LocationSearchController extends _$LocationSearchController {
  @override
  Map<String, List<Prediction>> build() {
    return {}; // Store predictions for each field
  }

  final TextEditingController myLocationController = TextEditingController();
  final TextEditingController workShopLocationController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Update predictions for a specific field
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
}
