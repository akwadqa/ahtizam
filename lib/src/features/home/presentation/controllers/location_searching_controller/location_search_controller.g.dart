// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationSearchController)
const locationSearchControllerProvider = LocationSearchControllerProvider._();

final class LocationSearchControllerProvider
    extends
        $NotifierProvider<
          LocationSearchController,
          Map<String, List<Prediction>>
        > {
  const LocationSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationSearchControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationSearchControllerHash();

  @$internal
  @override
  LocationSearchController create() => LocationSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<Prediction>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<Prediction>>>(
        value,
      ),
    );
  }
}

String _$locationSearchControllerHash() =>
    r'477fdbf1f36963bde8443485e503dc8ab8ca3aaf';

abstract class _$LocationSearchController
    extends $Notifier<Map<String, List<Prediction>>> {
  Map<String, List<Prediction>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<String, List<Prediction>>,
              Map<String, List<Prediction>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, List<Prediction>>,
                Map<String, List<Prediction>>
              >,
              Map<String, List<Prediction>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
