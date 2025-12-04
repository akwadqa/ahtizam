import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class PaymentDataSource {
  final NetworkService _networkService;

  PaymentDataSource(this._networkService);
  
Future<ApiResponse<String>> getPaymentUrl({
  required String orderId,
  required String language,
}) async {
  try {
    final response = await _networkService.get(
      EndPoints.getPaymentUrl,
      queryParameters: {
        'order_id': orderId,
        'language': language,
      },
    );

    final url = response.data?['data']?['payment_url'];
    if (url == null) {
      return ApiResponse.error(message: "No payment URL returned.");
    }

    return ApiResponse.success(data: url, message: response.data['message']);
  } catch (e) {
    return ApiResponse.error(message: e.toString());
  }
}

Future<ApiResponse<void>> confirmPayment() async {
  try {
    final response = await _networkService.get(
      EndPoints.updatePaymentStatus,
    );

    if (response.data['error'] == 0) {
      return ApiResponse.success(message: response.data['message']);
    } else {
      return ApiResponse.error(message: response.data['message']);
    }
  } catch (e) {
    return ApiResponse.error(message: e.toString());
  }
}
Future<ApiResponse<void>> payBySadad({
  required String orderId,
  required String token,
  required String method,
}) async {
  try {
    final response = await _networkService.post(
      EndPoints.updatePaymentStatus, // 👈 define this in your EndPoints class
      data: {
        'order_id': orderId,
        'payment_token': token,
        'method': method,
      },
    );

    if (response.data['error'] == 0) {
      return ApiResponse.success(message: response.data['message']);
    } else {
      return ApiResponse.error(message: response.data['message']);
    }
  } catch (e) {
    return ApiResponse.error(message: e.toString());
  }
}

Future<ApiResponse<void>> payByWallet({
  required String orderId,

}) async {
  try {
    final response = await _networkService.post(
      EndPoints.payByWalletApi,
      queryParameters: {
        'order_id': orderId,

      }
    );

    if (response.data['error'] == 0) {
      return ApiResponse.success(message: response.data['message']);
    } else {
      return ApiResponse.error(message: response.data['message']);
    }
  } catch (e) {
    return ApiResponse.error(message: e.toString());
  }
}

}
