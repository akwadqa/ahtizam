// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_truck_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectServiceTypeController)
const selectServiceTypeControllerProvider =
    SelectServiceTypeControllerProvider._();

final class SelectServiceTypeControllerProvider
    extends
        $AsyncNotifierProvider<
          SelectServiceTypeController,
          ServiceTypesState?
        > {
  const SelectServiceTypeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectServiceTypeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectServiceTypeControllerHash();

  @$internal
  @override
  SelectServiceTypeController create() => SelectServiceTypeController();
}

String _$selectServiceTypeControllerHash() =>
    r'299cd68c11eafcd73a69f4b4995b6b847fe7ef3d';

abstract class _$SelectServiceTypeController
    extends $AsyncNotifier<ServiceTypesState?> {
  FutureOr<ServiceTypesState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ServiceTypesState?>, ServiceTypesState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ServiceTypesState?>, ServiceTypesState?>,
              AsyncValue<ServiceTypesState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
