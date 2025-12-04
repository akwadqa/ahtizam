// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RateController)
const rateControllerProvider = RateControllerProvider._();

final class RateControllerProvider
    extends $NotifierProvider<RateController, RateState> {
  const RateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rateControllerHash();

  @$internal
  @override
  RateController create() => RateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RateState>(value),
    );
  }
}

String _$rateControllerHash() => r'97e2f38aebd4dbc4650db4a33f755b1b37e51f71';

abstract class _$RateController extends $Notifier<RateState> {
  RateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RateState, RateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RateState, RateState>,
              RateState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
