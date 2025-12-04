import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class PricesOfferDataSource {
  final NetworkService _networkService;

  PricesOfferDataSource(this._networkService);

  Future<ApiResponse<QuickOrderModel>> selectPricePffer({
    required String orderOfferId,
  }) async {
    try {
      final response = await _networkService
          .post(EndPoints.selectPriceOffer, queryParameters: {
        'quick_order_offer_id': orderOfferId,
      });

      if (response.data['error'] == 0) {
        return ApiResponse.fromJson(
          response.data,
          (json) => QuickOrderModel.fromJson(json as Map<String, dynamic>),
        );
      } else {
        return ApiResponse.error(message: response.data['message']);
      }
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
