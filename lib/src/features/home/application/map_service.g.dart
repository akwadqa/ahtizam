// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationPermissionHash() =>
    r'6448fdebe91563855a775ec0e57a9368959d5d65';

/// **Request location permission**
///
/// Copied from [locationPermission].
@ProviderFor(locationPermission)
final locationPermissionProvider = AutoDisposeFutureProvider<bool>.internal(
  locationPermission,
  name: r'locationPermissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPermissionRef = AutoDisposeFutureProviderRef<bool>;
String _$mapProviderHash() => r'dd5f2589e433d52d24d205bb76cd2cbb94936a65';

/// **Provide the current location (LatLng)**
///
/// Copied from [MapProvider].
@ProviderFor(MapProvider)
final mapProviderProvider =
    AsyncNotifierProvider<MapProvider, LatLng?>.internal(
  MapProvider.new,
  name: r'mapProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapProvider = AsyncNotifier<LatLng?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
