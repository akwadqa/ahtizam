// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(verificatonCodeRepository)
const verificatonCodeRepositoryProvider = VerificatonCodeRepositoryProvider._();

final class VerificatonCodeRepositoryProvider
    extends
        $FunctionalProvider<
          VerificatonCodeRepository,
          VerificatonCodeRepository,
          VerificatonCodeRepository
        >
    with $Provider<VerificatonCodeRepository> {
  const VerificatonCodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verificatonCodeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verificatonCodeRepositoryHash();

  @$internal
  @override
  $ProviderElement<VerificatonCodeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VerificatonCodeRepository create(Ref ref) {
    return verificatonCodeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerificatonCodeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerificatonCodeRepository>(value),
    );
  }
}

String _$verificatonCodeRepositoryHash() =>
    r'eb2d24556894423d21ce5eda0d95a0921320d521';
