// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_order_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// **Controls Third Widget Visibility**

@ProviderFor(ShowOrderFormController)
const showOrderFormControllerProvider = ShowOrderFormControllerProvider._();

/// **Controls Third Widget Visibility**
final class ShowOrderFormControllerProvider
    extends $NotifierProvider<ShowOrderFormController, bool> {
  /// **Controls Third Widget Visibility**
  const ShowOrderFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showOrderFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showOrderFormControllerHash();

  @$internal
  @override
  ShowOrderFormController create() => ShowOrderFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showOrderFormControllerHash() =>
    r'5bb7279efee3d0eb358ed440304fd108e28380b3';

/// **Controls Third Widget Visibility**

abstract class _$ShowOrderFormController extends $Notifier<bool> {
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
