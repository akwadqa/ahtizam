// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyOrdersController)
const myOrdersControllerProvider = MyOrdersControllerProvider._();

final class MyOrdersControllerProvider
    extends
        $AsyncNotifierProvider<MyOrdersController, List<MyOrderDetailsModel>> {
  const MyOrdersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myOrdersControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myOrdersControllerHash();

  @$internal
  @override
  MyOrdersController create() => MyOrdersController();
}

String _$myOrdersControllerHash() =>
    r'fc8b0f0509c73628a2348b3f959c214ac460257c';

abstract class _$MyOrdersController
    extends $AsyncNotifier<List<MyOrderDetailsModel>> {
  FutureOr<List<MyOrderDetailsModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<MyOrderDetailsModel>>,
              List<MyOrderDetailsModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<MyOrderDetailsModel>>,
                List<MyOrderDetailsModel>
              >,
              AsyncValue<List<MyOrderDetailsModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
