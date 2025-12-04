// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myOrdersRepository)
const myOrdersRepositoryProvider = MyOrdersRepositoryProvider._();

final class MyOrdersRepositoryProvider
    extends
        $FunctionalProvider<
          MyOrdersRepository,
          MyOrdersRepository,
          MyOrdersRepository
        >
    with $Provider<MyOrdersRepository> {
  const MyOrdersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myOrdersRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myOrdersRepositoryHash();

  @$internal
  @override
  $ProviderElement<MyOrdersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MyOrdersRepository create(Ref ref) {
    return myOrdersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyOrdersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyOrdersRepository>(value),
    );
  }
}

String _$myOrdersRepositoryHash() =>
    r'87aabccd35f167018ba11f12393f8c9a5af85a13';
