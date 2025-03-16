// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_coupon_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentCouponControllerHash() =>
    r'c07e35e0183461ad59867578909970002be41e55';

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

abstract class _$PaymentCouponController
    extends BuildlessAutoDisposeNotifier<PaymentState> {
  late final double totalCost;

  PaymentState build(
    double totalCost,
  );
}

/// See also [PaymentCouponController].
@ProviderFor(PaymentCouponController)
const paymentCouponControllerProvider = PaymentCouponControllerFamily();

/// See also [PaymentCouponController].
class PaymentCouponControllerFamily extends Family<PaymentState> {
  /// See also [PaymentCouponController].
  const PaymentCouponControllerFamily();

  /// See also [PaymentCouponController].
  PaymentCouponControllerProvider call(
    double totalCost,
  ) {
    return PaymentCouponControllerProvider(
      totalCost,
    );
  }

  @override
  PaymentCouponControllerProvider getProviderOverride(
    covariant PaymentCouponControllerProvider provider,
  ) {
    return call(
      provider.totalCost,
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
  String? get name => r'paymentCouponControllerProvider';
}

/// See also [PaymentCouponController].
class PaymentCouponControllerProvider extends AutoDisposeNotifierProviderImpl<
    PaymentCouponController, PaymentState> {
  /// See also [PaymentCouponController].
  PaymentCouponControllerProvider(
    double totalCost,
  ) : this._internal(
          () => PaymentCouponController()..totalCost = totalCost,
          from: paymentCouponControllerProvider,
          name: r'paymentCouponControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentCouponControllerHash,
          dependencies: PaymentCouponControllerFamily._dependencies,
          allTransitiveDependencies:
              PaymentCouponControllerFamily._allTransitiveDependencies,
          totalCost: totalCost,
        );

  PaymentCouponControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.totalCost,
  }) : super.internal();

  final double totalCost;

  @override
  PaymentState runNotifierBuild(
    covariant PaymentCouponController notifier,
  ) {
    return notifier.build(
      totalCost,
    );
  }

  @override
  Override overrideWith(PaymentCouponController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaymentCouponControllerProvider._internal(
        () => create()..totalCost = totalCost,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        totalCost: totalCost,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaymentCouponController, PaymentState>
      createElement() {
    return _PaymentCouponControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentCouponControllerProvider &&
        other.totalCost == totalCost;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, totalCost.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaymentCouponControllerRef
    on AutoDisposeNotifierProviderRef<PaymentState> {
  /// The parameter `totalCost` of this provider.
  double get totalCost;
}

class _PaymentCouponControllerProviderElement
    extends AutoDisposeNotifierProviderElement<PaymentCouponController,
        PaymentState> with PaymentCouponControllerRef {
  _PaymentCouponControllerProviderElement(super.provider);

  @override
  double get totalCost => (origin as PaymentCouponControllerProvider).totalCost;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
