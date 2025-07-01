import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_map_controller.g.dart';

@riverpod
class ShowMapController
    extends _$ShowMapController {
  @override
  bool build() => false;

  void toggleSelection() {
    state = !state;
  }
}
