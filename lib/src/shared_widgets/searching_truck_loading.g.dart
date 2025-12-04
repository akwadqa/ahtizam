// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searching_truck_loading.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchTimer)
const searchTimerProvider = SearchTimerProvider._();

final class SearchTimerProvider
    extends $NotifierProvider<SearchTimer, SearchTimerState> {
  const SearchTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchTimerHash();

  @$internal
  @override
  SearchTimer create() => SearchTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchTimerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchTimerState>(value),
    );
  }
}

String _$searchTimerHash() => r'31946f6945b56a404cb59296b09407e0113e4e67';

abstract class _$SearchTimer extends $Notifier<SearchTimerState> {
  SearchTimerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SearchTimerState, SearchTimerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchTimerState, SearchTimerState>,
              SearchTimerState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
