import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class MyOrderDetailsDatasource {
  final NetworkService _networkService;

  MyOrderDetailsDatasource(this._networkService);

  Future<ApiResponse<MyOrderDetailsModel>> getOrderDetails(
      String quickOrderId) async {
    try {
      final response = await _networkService.get(
        EndPoints.orderDetailsApi,
        queryParameters: {
          'quick_order_id': quickOrderId,
          "action": "passenger"
        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => MyOrderDetailsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
