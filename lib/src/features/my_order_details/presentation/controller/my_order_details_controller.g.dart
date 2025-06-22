// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myOrderDetailsControllerHash() =>
    r'614f9d17f6908f57d804ff3818000aac8cb9156b';

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

abstract class _$MyOrderDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<MyOrderDetailsModel?> {
  late final String quickOrderId;

  FutureOr<MyOrderDetailsModel?> build(
    String quickOrderId,
  );
}

/// See also [MyOrderDetailsController].
@ProviderFor(MyOrderDetailsController)
const myOrderDetailsControllerProvider = MyOrderDetailsControllerFamily();

/// See also [MyOrderDetailsController].
class MyOrderDetailsControllerFamily
    extends Family<AsyncValue<MyOrderDetailsModel?>> {
  /// See also [MyOrderDetailsController].
  const MyOrderDetailsControllerFamily();

  /// See also [MyOrderDetailsController].
  MyOrderDetailsControllerProvider call(
    String quickOrderId,
  ) {
    return MyOrderDetailsControllerProvider(
      quickOrderId,
    );
  }

  @override
  MyOrderDetailsControllerProvider getProviderOverride(
    covariant MyOrderDetailsControllerProvider provider,
  ) {
    return call(
      provider.quickOrderId,
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
  String? get name => r'myOrderDetailsControllerProvider';
}

/// See also [MyOrderDetailsController].
class MyOrderDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MyOrderDetailsController,
        MyOrderDetailsModel?> {
  /// See also [MyOrderDetailsController].
  MyOrderDetailsControllerProvider(
    String quickOrderId,
  ) : this._internal(
          () => MyOrderDetailsController()..quickOrderId = quickOrderId,
          from: myOrderDetailsControllerProvider,
          name: r'myOrderDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myOrderDetailsControllerHash,
          dependencies: MyOrderDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              MyOrderDetailsControllerFamily._allTransitiveDependencies,
          quickOrderId: quickOrderId,
        );

  MyOrderDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quickOrderId,
  }) : super.internal();

  final String quickOrderId;

  @override
  FutureOr<MyOrderDetailsModel?> runNotifierBuild(
    covariant MyOrderDetailsController notifier,
  ) {
    return notifier.build(
      quickOrderId,
    );
  }

  @override
  Override overrideWith(MyOrderDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyOrderDetailsControllerProvider._internal(
        () => create()..quickOrderId = quickOrderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quickOrderId: quickOrderId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MyOrderDetailsController,
      MyOrderDetailsModel?> createElement() {
    return _MyOrderDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyOrderDetailsControllerProvider &&
        other.quickOrderId == quickOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quickOrderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MyOrderDetailsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<MyOrderDetailsModel?> {
  /// The parameter `quickOrderId` of this provider.
  String get quickOrderId;
}

class _MyOrderDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MyOrderDetailsController,
        MyOrderDetailsModel?> with MyOrderDetailsControllerRef {
  _MyOrderDetailsControllerProviderElement(super.provider);

  @override
  String get quickOrderId =>
      (origin as MyOrderDetailsControllerProvider).quickOrderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
