// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentController)
const paymentControllerProvider = PaymentControllerProvider._();

final class PaymentControllerProvider
    extends $AsyncNotifierProvider<PaymentController, PaymentState> {
  const PaymentControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentControllerHash();

  @$internal
  @override
  PaymentController create() => PaymentController();
}

String _$paymentControllerHash() => r'883e1ffefbb9b239b6cdeae395775ee5a7b29696';

abstract class _$PaymentController extends $AsyncNotifier<PaymentState> {
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
