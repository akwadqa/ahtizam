// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_offers_notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdersOffersNotificationsController)
const ordersOffersNotificationsControllerProvider =
    OrdersOffersNotificationsControllerProvider._();

final class OrdersOffersNotificationsControllerProvider
    extends
        $AsyncNotifierProvider<
          OrdersOffersNotificationsController,
          List<OrdersOfferNotificationsModel>
        > {
  const OrdersOffersNotificationsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersOffersNotificationsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$ordersOffersNotificationsControllerHash();

  @$internal
  @override
  OrdersOffersNotificationsController create() =>
      OrdersOffersNotificationsController();
}

String _$ordersOffersNotificationsControllerHash() =>
    r'a8bba4b6ff407a66ebbbadb59374195ecb582feb';

abstract class _$OrdersOffersNotificationsController
    extends $AsyncNotifier<List<OrdersOfferNotificationsModel>> {
  FutureOr<List<OrdersOfferNotificationsModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<OrdersOfferNotificationsModel>>,
              List<OrdersOfferNotificationsModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<OrdersOfferNotificationsModel>>,
                List<OrdersOfferNotificationsModel>
              >,
              AsyncValue<List<OrdersOfferNotificationsModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
