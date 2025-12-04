// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_coupon_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentCouponController)
const paymentCouponControllerProvider = PaymentCouponControllerProvider._();

final class PaymentCouponControllerProvider
    extends $AsyncNotifierProvider<PaymentCouponController, PaymentState> {
  const PaymentCouponControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentCouponControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentCouponControllerHash();

  @$internal
  @override
  PaymentCouponController create() => PaymentCouponController();
}

String _$paymentCouponControllerHash() =>
    r'e24326e2ec6e55b463e56284a39457de4ce3cc17';

abstract class _$PaymentCouponController extends $AsyncNotifier<PaymentState> {
  FutureOr<PaymentState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<PaymentState>, PaymentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PaymentState>, PaymentState>,
              AsyncValue<PaymentState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
