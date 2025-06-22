import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/controllers/toggle_layers_controllers/change_request_order_state_service.dart';
import '../presentation/controllers/toggle_layers_controllers/hide_layers_during_order_controller.dart';

part 'home_service.g.dart';

@riverpod
class HomeService extends _$HomeService {
  @override
  void build() {}
Future<void> resetLayers(BuildContext context) async {
  final navigator = Navigator.of(context, rootNavigator: true);
  int maxPops = 4;
  int pops = 0;

  while (navigator.canPop() && pops < maxPops) {
    navigator.pop();
    pops++;
    await Future.delayed(const Duration(milliseconds: 2));
  }

  ref
      .read(hideLayersDuringOrderControllerProvider.notifier)
      .hideLayersDuringOrder();
  ref
      .read(changeRequestOrderStateServiceProvider.notifier)
      .toggleWidget();
  ref
      .read(quickOrderControllerProvider.notifier)
      .resetOrderDetails();
}

}
