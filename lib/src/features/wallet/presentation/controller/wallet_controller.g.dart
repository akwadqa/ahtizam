// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WalletController)
const walletControllerProvider = WalletControllerProvider._();

final class WalletControllerProvider
    extends $AsyncNotifierProvider<WalletController, WalletModel> {
  const WalletControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletControllerHash();

  @$internal
  @override
  WalletController create() => WalletController();
}

String _$walletControllerHash() => r'c05ba5e2ed747e79111b8b73d36be77850356cba';

abstract class _$WalletController extends $AsyncNotifier<WalletModel> {
  FutureOr<WalletModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WalletModel>, WalletModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WalletModel>, WalletModel>,
              AsyncValue<WalletModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
