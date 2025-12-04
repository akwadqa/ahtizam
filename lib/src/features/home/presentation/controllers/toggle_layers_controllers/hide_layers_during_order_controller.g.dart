// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_layers_during_order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// **Provider to Manage Widget Visibility**

@ProviderFor(HideLayersDuringOrderController)
const hideLayersDuringOrderControllerProvider =
    HideLayersDuringOrderControllerProvider._();

/// **Provider to Manage Widget Visibility**
final class HideLayersDuringOrderControllerProvider
    extends $NotifierProvider<HideLayersDuringOrderController, bool> {
  /// **Provider to Manage Widget Visibility**
  const HideLayersDuringOrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hideLayersDuringOrderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hideLayersDuringOrderControllerHash();

  @$internal
  @override
  HideLayersDuringOrderController create() => HideLayersDuringOrderController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hideLayersDuringOrderControllerHash() =>
    r'84406cecd3c6f156ae44dc4c08110a6dfd4d4b8b';

/// **Provider to Manage Widget Visibility**

abstract class _$HideLayersDuringOrderController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
