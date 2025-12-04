// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsController)
const settingsControllerProvider = SettingsControllerProvider._();

final class SettingsControllerProvider
    extends $AsyncNotifierProvider<SettingsController, SettingsDataModel?> {
  const SettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsControllerHash();

  @$internal
  @override
  SettingsController create() => SettingsController();
}

String _$settingsControllerHash() =>
    r'09aad706c1b5d015c4c64bc9b0247d7e0fc2a560';

abstract class _$SettingsController extends $AsyncNotifier<SettingsDataModel?> {
  FutureOr<SettingsDataModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SettingsDataModel?>, SettingsDataModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SettingsDataModel?>, SettingsDataModel?>,
              AsyncValue<SettingsDataModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
