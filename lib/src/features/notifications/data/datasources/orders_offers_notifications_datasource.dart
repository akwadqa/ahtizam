import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/notifications/domain/model/orders_offer_notifications_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class NotificationsDatasource {
  final NetworkService _networkService;

  NotificationsDatasource(this._networkService);

  Future<ApiResponse<List<OrdersOfferNotificationsModel>>> getAllNotification(
    int page,
    String? quickOrderOfferId
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.ordersNotificationsApi,
        queryParameters: {
          'page': page,
         if(quickOrderOfferId!=null) "quick_order_offer_id": quickOrderOfferId

        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                OrdersOfferNotificationsModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
