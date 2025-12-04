// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_driver_sheet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(showDriverSheet)
const showDriverSheetProvider = ShowDriverSheetProvider._();

final class ShowDriverSheetProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const ShowDriverSheetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showDriverSheetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showDriverSheetHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showDriverSheet(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showDriverSheetHash() => r'a9534bb80ac321c7d5c359cd4a9b72e8381b28b9';
