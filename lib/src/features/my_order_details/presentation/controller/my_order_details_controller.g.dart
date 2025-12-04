// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyOrderDetailsController)
const myOrderDetailsControllerProvider = MyOrderDetailsControllerFamily._();

final class MyOrderDetailsControllerProvider
    extends
        $AsyncNotifierProvider<MyOrderDetailsController, MyOrderDetailsModel?> {
  const MyOrderDetailsControllerProvider._({
    required MyOrderDetailsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'myOrderDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$myOrderDetailsControllerHash();

  @override
  String toString() {
    return r'myOrderDetailsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MyOrderDetailsController create() => MyOrderDetailsController();

  @override
  bool operator ==(Object other) {
    return other is MyOrderDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myOrderDetailsControllerHash() =>
    r'614f9d17f6908f57d804ff3818000aac8cb9156b';

final class MyOrderDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MyOrderDetailsController,
          AsyncValue<MyOrderDetailsModel?>,
          MyOrderDetailsModel?,
          FutureOr<MyOrderDetailsModel?>,
          String
        > {
  const MyOrderDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'myOrderDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MyOrderDetailsControllerProvider call(String quickOrderId) =>
      MyOrderDetailsControllerProvider._(argument: quickOrderId, from: this);

  @override
  String toString() => r'myOrderDetailsControllerProvider';
}

abstract class _$MyOrderDetailsController
    extends $AsyncNotifier<MyOrderDetailsModel?> {
  late final _$args = ref.$arg as String;
  String get quickOrderId => _$args;

  FutureOr<MyOrderDetailsModel?> build(String quickOrderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<MyOrderDetailsModel?>, MyOrderDetailsModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<MyOrderDetailsModel?>,
                MyOrderDetailsModel?
              >,
              AsyncValue<MyOrderDetailsModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
