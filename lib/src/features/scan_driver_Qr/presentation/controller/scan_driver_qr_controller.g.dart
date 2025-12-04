// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_driver_qr_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanDriverQrController)
const scanDriverQrControllerProvider = ScanDriverQrControllerProvider._();

final class ScanDriverQrControllerProvider
    extends $AsyncNotifierProvider<ScanDriverQrController, ScanDriverQrState?> {
  const ScanDriverQrControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanDriverQrControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanDriverQrControllerHash();

  @$internal
  @override
  ScanDriverQrController create() => ScanDriverQrController();
}

String _$scanDriverQrControllerHash() =>
    r'00f6a56c63ba6e97e950c811d094f30a6b55fdf4';

abstract class _$ScanDriverQrController
    extends $AsyncNotifier<ScanDriverQrState?> {
  FutureOr<ScanDriverQrState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ScanDriverQrState?>, ScanDriverQrState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScanDriverQrState?>, ScanDriverQrState?>,
              AsyncValue<ScanDriverQrState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
