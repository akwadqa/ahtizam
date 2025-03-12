import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_order_form_controller.g.dart';

/// **Controls Third Widget Visibility**
@riverpod
class ShowOrderFormController extends _$ShowOrderFormController {
  @override
  bool build() => false;

  void toggleVisibility() {
    state = !state;
  }
}
