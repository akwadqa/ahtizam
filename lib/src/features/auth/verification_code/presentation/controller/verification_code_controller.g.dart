// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerificationCodeController)
const verificationCodeControllerProvider =
    VerificationCodeControllerProvider._();

final class VerificationCodeControllerProvider
    extends $AsyncNotifierProvider<VerificationCodeController, void> {
  const VerificationCodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verificationCodeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verificationCodeControllerHash();

  @$internal
  @override
  VerificationCodeController create() => VerificationCodeController();
}

String _$verificationCodeControllerHash() =>
    r'c1364766a6e1b98957ce4e11f8405422e8656f4c';

abstract class _$VerificationCodeController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
