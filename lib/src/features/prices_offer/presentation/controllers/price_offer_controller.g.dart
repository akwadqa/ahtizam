// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_offer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PriceOfferController)
const priceOfferControllerProvider = PriceOfferControllerProvider._();

final class PriceOfferControllerProvider
    extends $AsyncNotifierProvider<PriceOfferController, PriceOfferState?> {
  const PriceOfferControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'priceOfferControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$priceOfferControllerHash();

  @$internal
  @override
  PriceOfferController create() => PriceOfferController();
}

String _$priceOfferControllerHash() =>
    r'a461cf032ad40190c2eee304985f93eae94d3dbb';

abstract class _$PriceOfferController extends $AsyncNotifier<PriceOfferState?> {
  FutureOr<PriceOfferState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<PriceOfferState?>, PriceOfferState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PriceOfferState?>, PriceOfferState?>,
              AsyncValue<PriceOfferState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
