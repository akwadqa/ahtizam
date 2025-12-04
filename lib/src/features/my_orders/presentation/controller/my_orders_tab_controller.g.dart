// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_tab_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// --- CONTROLLER ---

@ProviderFor(OrdersTabController)
const ordersTabControllerProvider = OrdersTabControllerProvider._();

/// --- CONTROLLER ---
final class OrdersTabControllerProvider
    extends $NotifierProvider<OrdersTabController, int> {
  /// --- CONTROLLER ---
  const OrdersTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersTabControllerHash();

  @$internal
  @override
  OrdersTabController create() => OrdersTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$ordersTabControllerHash() =>
    r'35bdaa3446b94c29b4d931d0f38e198c2bedee55';

/// --- CONTROLLER ---

abstract class _$OrdersTabController extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
