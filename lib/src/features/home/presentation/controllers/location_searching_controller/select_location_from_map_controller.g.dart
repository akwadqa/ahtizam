// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_location_from_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectLocationFromMapController)
const selectLocationFromMapControllerProvider =
    SelectLocationFromMapControllerProvider._();

final class SelectLocationFromMapControllerProvider
    extends $NotifierProvider<SelectLocationFromMapController, bool> {
  const SelectLocationFromMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectLocationFromMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectLocationFromMapControllerHash();

  @$internal
  @override
  SelectLocationFromMapController create() => SelectLocationFromMapController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$selectLocationFromMapControllerHash() =>
    r'd660fd24bff73f01b4bb70f6be97239957afa81d';

abstract class _$SelectLocationFromMapController extends $Notifier<bool> {
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
