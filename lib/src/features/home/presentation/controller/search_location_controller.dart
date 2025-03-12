import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_location_picker/map_location_picker.dart';

part 'search_location_controller.g.dart';

/// **Location Search Controller using `map_location_picker`**
@riverpod
class LocationSearchController extends _$LocationSearchController {
  @override
  List<GeocodingResult> build() => [];

  /// **Fetch location suggestions by selecting from the map**
  Future<void> fetchLocationFromMap(GeocodingResult result) async {
    try {
      state = [result]; // Store the selected location
    } catch (e) {
      print("Error fetching location: $e");
      state = [];
    }
  }

  /// **Clear selected location**
  void clearLocation() {
    state = [];
  }
}
