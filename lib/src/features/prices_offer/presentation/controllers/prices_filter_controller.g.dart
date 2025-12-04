// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PricesFilterController)
const pricesFilterControllerProvider = PricesFilterControllerProvider._();

final class PricesFilterControllerProvider
    extends $NotifierProvider<PricesFilterController, PriceFilterType> {
  const PricesFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pricesFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pricesFilterControllerHash();

  @$internal
  @override
  PricesFilterController create() => PricesFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PriceFilterType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PriceFilterType>(value),
    );
  }
}

String _$pricesFilterControllerHash() =>
    r'95435b9fec46117baadac95f07e891dec58589b3';

abstract class _$PricesFilterController extends $Notifier<PriceFilterType> {
  PriceFilterType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PriceFilterType, PriceFilterType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PriceFilterType, PriceFilterType>,
              PriceFilterType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
