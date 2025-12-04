// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderSessionController)
const orderSessionControllerProvider = OrderSessionControllerProvider._();

final class OrderSessionControllerProvider
    extends $NotifierProvider<OrderSessionController, OrderSessionState> {
  const OrderSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderSessionControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderSessionControllerHash();

  @$internal
  @override
  OrderSessionController create() => OrderSessionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderSessionState>(value),
    );
  }
}

String _$orderSessionControllerHash() =>
    r'cc073bdeb6fbdaac1196dae2c305ed5df3db539e';

abstract class _$OrderSessionController extends $Notifier<OrderSessionState> {
  OrderSessionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrderSessionState, OrderSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderSessionState, OrderSessionState>,
              OrderSessionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
