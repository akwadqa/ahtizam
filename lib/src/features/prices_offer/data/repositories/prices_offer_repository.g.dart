// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_offer_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pricesOfferRepository)
const pricesOfferRepositoryProvider = PricesOfferRepositoryProvider._();

final class PricesOfferRepositoryProvider
    extends
        $FunctionalProvider<
          PricesOfferRepository,
          PricesOfferRepository,
          PricesOfferRepository
        >
    with $Provider<PricesOfferRepository> {
  const PricesOfferRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pricesOfferRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pricesOfferRepositoryHash();

  @$internal
  @override
  $ProviderElement<PricesOfferRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PricesOfferRepository create(Ref ref) {
    return pricesOfferRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PricesOfferRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PricesOfferRepository>(value),
    );
  }
}

String _$pricesOfferRepositoryHash() =>
    r'fd3c7631095a08552a8670ff308067cbe322de00';
