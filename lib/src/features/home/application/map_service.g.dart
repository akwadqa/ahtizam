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
String _$mapControllerHash() => r'228e716bde9884eb992ff73f2278daab06a09f5a';

/// **Provide the current location (LatLng)**
///
/// Copied from [MapController].
@ProviderFor(MapController)
final mapControllerProvider =
    AsyncNotifierProvider<MapController, LatLng?>.internal(
  MapController.new,
  name: r'mapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapController = AsyncNotifier<LatLng?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
