// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuickOrderController)
const quickOrderControllerProvider = QuickOrderControllerProvider._();

final class QuickOrderControllerProvider
    extends $AsyncNotifierProvider<QuickOrderController, OrderState?> {
  const QuickOrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickOrderControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickOrderControllerHash();

  @$internal
  @override
  QuickOrderController create() => QuickOrderController();
}

String _$quickOrderControllerHash() =>
    r'a143783a00cc97cc531e41fa89981eab090148d8';

abstract class _$QuickOrderController extends $AsyncNotifier<OrderState?> {
  FutureOr<OrderState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<OrderState?>, OrderState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrderState?>, OrderState?>,
              AsyncValue<OrderState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
