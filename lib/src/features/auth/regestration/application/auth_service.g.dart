// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  const SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'ca329d21cb9532acf76436fc839fde21c0b7f1e6';

@ProviderFor(UserData)
const userDataProvider = UserDataProvider._();

final class UserDataProvider extends $NotifierProvider<UserData, String?> {
  const UserDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDataHash();

  @$internal
  @override
  UserData create() => UserData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$userDataHash() => r'eb6393c41d2ae9234b8d8687c81281055d2264d7';

abstract class _$UserData extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isAuthinticated)
const isAuthinticatedProvider = IsAuthinticatedProvider._();

final class IsAuthinticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsAuthinticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAuthinticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAuthinticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthinticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthinticatedHash() => r'06718e95e3ceea2ea9b79d792cbdee9e9cc4164c';

/// **Check if the app is opened for the first time**

@ProviderFor(isFirstTimeOpeningApp)
const isFirstTimeOpeningAppProvider = IsFirstTimeOpeningAppProvider._();

/// **Check if the app is opened for the first time**

final class IsFirstTimeOpeningAppProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// **Check if the app is opened for the first time**
  const IsFirstTimeOpeningAppProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isFirstTimeOpeningAppProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isFirstTimeOpeningAppHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isFirstTimeOpeningApp(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isFirstTimeOpeningAppHash() =>
    r'23a178abb80b29189c479e4e42c8a67b23782056';
