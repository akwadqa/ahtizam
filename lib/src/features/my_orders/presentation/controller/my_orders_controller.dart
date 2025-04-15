import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_controller.g.dart';

/// --- CONTROLLER ---
@riverpod
class OrdersTabController extends _$OrdersTabController {
  @override
  int build() => 0; // 0 => Ongoing, 1 => Past

  void switchTab(int index) => state = index;
}
