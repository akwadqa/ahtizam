import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_order_form_controller.g.dart';

/// **Controls Third Widget Visibility**
@riverpod
class ShowOrderFormController extends _$ShowOrderFormController {
  String initiallValue = "request_now";

  @override
  bool build() => false;

  void toggleVisibility() {
    state = !state;
  }


  String intialValueToOrder(String initial) {
    initiallValue = initial;
    return initial;
  }
}
