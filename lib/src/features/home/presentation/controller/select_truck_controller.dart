import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_truck_controller.g.dart';

/// **Truck Selection Controller**
@riverpod
class SelectTruckController extends _$SelectTruckController {
  @override
  int? build() => null;

  /// **Set the Selected Truck**
  void selectTruck(int index) {
    state = index;
  }

  /// **Clear the Selected Truck**
  void clearSelection() {
    state = null;
  }
}
