import 'package:ahtizam/src/features/home/presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/controllers/toggle_layers_controllers/change_request_order_state_service.dart';


part 'home_service.g.dart';

/// **Provider to Manage Widget Visibility**
@riverpod
class HomeService extends _$HomeService {
  @override
  void build() {} // Initially showing first widget

  /// Toggle between widgets
  void resetLayers(context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    // ref.read(mapControllerProvider.notifier)
    //   ..resetPoints()
    //   ..updateLocation();
              //  ref
              //           .read(hideLayersDuringOrderControllerProvider.notifier)
              //           .hideLayersDuringOrder();
    ref.read(changeRequestOrderStateServiceProvider.notifier).toggleWidget();
    // ref.read(showOrderFormControllerProvider.notifier).toggleVisibility();
  }
}
