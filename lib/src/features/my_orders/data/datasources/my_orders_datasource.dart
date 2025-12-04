import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class MyOrdersDatasource {
  final NetworkService _networkService;

  MyOrdersDatasource(this._networkService);

  Future<ApiResponse<List<MyOrderDetailsModel>>> getAllOrders(
    int page
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.orderDetailsApi,
     
        queryParameters: {
          'page': page,
          "action":"passenger"

        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                MyOrderDetailsModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
