// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddCardController)
const addCardControllerProvider = AddCardControllerProvider._();

final class AddCardControllerProvider
    extends $NotifierProvider<AddCardController, AddCardState> {
  const AddCardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addCardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addCardControllerHash();

  @$internal
  @override
  AddCardController create() => AddCardController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddCardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddCardState>(value),
    );
  }
}

String _$addCardControllerHash() => r'64997b6864efc66f32b29abc9f8320eedb6e0f3d';

abstract class _$AddCardController extends $Notifier<AddCardState> {
  AddCardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddCardState, AddCardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddCardState, AddCardState>,
              AddCardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
