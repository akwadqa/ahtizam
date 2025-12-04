import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_location_from_map_controller.g.dart';

@riverpod
class SelectLocationFromMapController
    extends _$SelectLocationFromMapController {
  @override
  bool build() => false;

  void toggleSelection() {
    state = !state;
  }
}
