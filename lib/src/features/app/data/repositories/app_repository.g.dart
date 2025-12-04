// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appRepository)
const appRepositoryProvider = AppRepositoryProvider._();

final class AppRepositoryProvider
    extends $FunctionalProvider<AppRepository, AppRepository, AppRepository>
    with $Provider<AppRepository> {
  const AppRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRepository create(Ref ref) {
    return appRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRepository>(value),
    );
  }
}

String _$appRepositoryHash() => r'6d036b12ec45b303849c103a98c485530ef5ab32';
