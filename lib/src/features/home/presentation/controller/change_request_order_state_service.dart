import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_request_order_state_service.g.dart';

/// **Provider to Manage Widget Visibility**
@riverpod
class ChangeRequestOrderStateService extends _$ChangeRequestOrderStateService {
  @override
  bool build() => false; // Initially showing first widget

  /// Toggle between widgets
  void toggleWidget() {
    state = !state;
  }
}
