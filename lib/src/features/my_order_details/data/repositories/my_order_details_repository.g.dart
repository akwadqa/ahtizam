// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_details_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myOrderDetailsRepository)
const myOrderDetailsRepositoryProvider = MyOrderDetailsRepositoryProvider._();

final class MyOrderDetailsRepositoryProvider
    extends
        $FunctionalProvider<
          MyOrderDetailsRepository,
          MyOrderDetailsRepository,
          MyOrderDetailsRepository
        >
    with $Provider<MyOrderDetailsRepository> {
  const MyOrderDetailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myOrderDetailsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myOrderDetailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<MyOrderDetailsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MyOrderDetailsRepository create(Ref ref) {
    return myOrderDetailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyOrderDetailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyOrderDetailsRepository>(value),
    );
  }
}

String _$myOrderDetailsRepositoryHash() =>
    r'e1ed1acc0e896209724941ac1f1451068a7942b0';
