import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/notifications/data/datasources/orders_offers_notifications_datasource.dart';
import 'package:ahtizam/src/features/notifications/domain/model/orders_offer_notifications_model.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_offers_notifications_repository.g.dart';

@Riverpod(keepAlive: true)
OrdersOffersNotificationsRepository ordersOffersNotificationsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return OrdersOffersNotificationsRepository(NotificationsDatasource(networkService));
}

class OrdersOffersNotificationsRepository {
  final NotificationsDatasource _remoteDataSource;

  OrdersOffersNotificationsRepository(this._remoteDataSource);

  Future<ApiResponse<List<OrdersOfferNotificationsModel>>> getAllOrdersNotifications(
      {required int page,String? quickOrderOfferId,}) async {
    try {
      final result = await _remoteDataSource.getAllNotification(page,quickOrderOfferId);
      if (result.hasFailed) {
        throw Exception(
          result.message ?? 'Failed to fetch OrdersOfferNotifications',
        );
      }
      // if (result.status == 200) {
      return result;
      // }
    } catch (e) {
      throw Exception('Failed to Get OrdersOfferNotifications: $e');
    }
  }

  // }
}
