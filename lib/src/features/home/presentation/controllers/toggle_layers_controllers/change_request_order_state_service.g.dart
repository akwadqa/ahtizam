// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_request_order_state_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// **Provider to Manage Widget Visibility**

@ProviderFor(ChangeRequestOrderStateService)
const changeRequestOrderStateServiceProvider =
    ChangeRequestOrderStateServiceProvider._();

/// **Provider to Manage Widget Visibility**
final class ChangeRequestOrderStateServiceProvider
    extends $NotifierProvider<ChangeRequestOrderStateService, bool> {
  /// **Provider to Manage Widget Visibility**
  const ChangeRequestOrderStateServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changeRequestOrderStateServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changeRequestOrderStateServiceHash();

  @$internal
  @override
  ChangeRequestOrderStateService create() => ChangeRequestOrderStateService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$changeRequestOrderStateServiceHash() =>
    r'0e92659d007278bc49e2bbce37bb446aab5d93d1';

/// **Provider to Manage Widget Visibility**

abstract class _$ChangeRequestOrderStateService extends $Notifier<bool> {
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
