// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_offers_notifications_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ordersOffersNotificationsRepository)
const ordersOffersNotificationsRepositoryProvider =
    OrdersOffersNotificationsRepositoryProvider._();

final class OrdersOffersNotificationsRepositoryProvider
    extends
        $FunctionalProvider<
          OrdersOffersNotificationsRepository,
          OrdersOffersNotificationsRepository,
          OrdersOffersNotificationsRepository
        >
    with $Provider<OrdersOffersNotificationsRepository> {
  const OrdersOffersNotificationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersOffersNotificationsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$ordersOffersNotificationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrdersOffersNotificationsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrdersOffersNotificationsRepository create(Ref ref) {
    return ordersOffersNotificationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersOffersNotificationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersOffersNotificationsRepository>(
        value,
      ),
    );
  }
}

String _$ordersOffersNotificationsRepositoryHash() =>
    r'118d2f2f4d6fe63f30c157fd14b6361b170758e7';
