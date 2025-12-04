// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationPermission)
const locationPermissionProvider = LocationPermissionProvider._();

final class LocationPermissionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const LocationPermissionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPermissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPermissionHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return locationPermission(ref);
  }
}

String _$locationPermissionHash() =>
    r'147e634abd3b157a19388c1fa7b217673d1b9cbf';

/// **Provide the current location (LatLng)**

@ProviderFor(MapController)
const mapControllerProvider = MapControllerProvider._();

/// **Provide the current location (LatLng)**
final class MapControllerProvider
    extends $AsyncNotifierProvider<MapController, LatLng?> {
  /// **Provide the current location (LatLng)**
  const MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  MapController create() => MapController();
}

String _$mapControllerHash() => r'ed1706ea39749b668e82ea2394b629e4ee7ce368';

/// **Provide the current location (LatLng)**

abstract class _$MapController extends $AsyncNotifier<LatLng?> {
  FutureOr<LatLng?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LatLng?>, LatLng?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LatLng?>, LatLng?>,
              AsyncValue<LatLng?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
