// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unreadNotificationsCountHash() =>
    r'39dbd9030c0cc2dab0c1f07d996d4f222e0b29ae';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [unreadNotificationsCount].
@ProviderFor(unreadNotificationsCount)
const unreadNotificationsCountProvider = UnreadNotificationsCountFamily();

/// See also [unreadNotificationsCount].
class UnreadNotificationsCountFamily extends Family<AsyncValue<int>> {
  /// See also [unreadNotificationsCount].
  const UnreadNotificationsCountFamily();

  /// See also [unreadNotificationsCount].
  UnreadNotificationsCountProvider call(
    String userId,
  ) {
    return UnreadNotificationsCountProvider(
      userId,
    );
  }

  @override
  UnreadNotificationsCountProvider getProviderOverride(
    covariant UnreadNotificationsCountProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'unreadNotificationsCountProvider';
}

/// See also [unreadNotificationsCount].
class UnreadNotificationsCountProvider extends AutoDisposeStreamProvider<int> {
  /// See also [unreadNotificationsCount].
  UnreadNotificationsCountProvider(
    String userId,
  ) : this._internal(
          (ref) => unreadNotificationsCount(
            ref as UnreadNotificationsCountRef,
            userId,
          ),
          from: unreadNotificationsCountProvider,
          name: r'unreadNotificationsCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unreadNotificationsCountHash,
          dependencies: UnreadNotificationsCountFamily._dependencies,
          allTransitiveDependencies:
              UnreadNotificationsCountFamily._allTransitiveDependencies,
          userId: userId,
        );

  UnreadNotificationsCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<int> Function(UnreadNotificationsCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UnreadNotificationsCountProvider._internal(
        (ref) => create(ref as UnreadNotificationsCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _UnreadNotificationsCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnreadNotificationsCountProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UnreadNotificationsCountRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UnreadNotificationsCountProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with UnreadNotificationsCountRef {
  _UnreadNotificationsCountProviderElement(super.provider);

  @override
  String get userId => (origin as UnreadNotificationsCountProvider).userId;
}

String _$notificationControllerHash() =>
    r'7243db0dcc01c064555b74ef3cf56ea3c89942fc';

abstract class _$NotificationController
    extends BuildlessAutoDisposeStreamNotifier<List<NotificationModel>> {
  late final String userId;

  Stream<List<NotificationModel>> build(
    String userId,
  );
}

/// See also [NotificationController].
@ProviderFor(NotificationController)
const notificationControllerProvider = NotificationControllerFamily();

/// See also [NotificationController].
class NotificationControllerFamily
    extends Family<AsyncValue<List<NotificationModel>>> {
  /// See also [NotificationController].
  const NotificationControllerFamily();

  /// See also [NotificationController].
  NotificationControllerProvider call(
    String userId,
  ) {
    return NotificationControllerProvider(
      userId,
    );
  }

  @override
  NotificationControllerProvider getProviderOverride(
    covariant NotificationControllerProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'notificationControllerProvider';
}

/// See also [NotificationController].
class NotificationControllerProvider
    extends AutoDisposeStreamNotifierProviderImpl<NotificationController,
        List<NotificationModel>> {
  /// See also [NotificationController].
  NotificationControllerProvider(
    String userId,
  ) : this._internal(
          () => NotificationController()..userId = userId,
          from: notificationControllerProvider,
          name: r'notificationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationControllerHash,
          dependencies: NotificationControllerFamily._dependencies,
          allTransitiveDependencies:
              NotificationControllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  NotificationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Stream<List<NotificationModel>> runNotifierBuild(
    covariant NotificationController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(NotificationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: NotificationControllerProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<NotificationController,
      List<NotificationModel>> createElement() {
    return _NotificationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NotificationControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<NotificationModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _NotificationControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<NotificationController,
        List<NotificationModel>> with NotificationControllerRef {
  _NotificationControllerProviderElement(super.provider);

  @override
  String get userId => (origin as NotificationControllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
