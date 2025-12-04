import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hide_layers_during_order_controller.g.dart';

/// **Provider to Manage Widget Visibility**
@riverpod
class HideLayersDuringOrderController extends _$HideLayersDuringOrderController {
  @override
  bool build() => false; // Initially showing first widget

  /// Toggle between widgets
  void hideLayersDuringOrder() {
    state = !state;
  }
}
