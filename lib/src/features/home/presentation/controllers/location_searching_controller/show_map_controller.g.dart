// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShowMapController)
const showMapControllerProvider = ShowMapControllerProvider._();

final class ShowMapControllerProvider
    extends $NotifierProvider<ShowMapController, bool> {
  const ShowMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showMapControllerHash();

  @$internal
  @override
  ShowMapController create() => ShowMapController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showMapControllerHash() => r'3a7389b9d63cde53aee99beef1e7da7bddcb6446';

abstract class _$ShowMapController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
