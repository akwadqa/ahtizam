import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/service_types/service_types_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PaymentDataSource {
  final NetworkService _networkService;

  PaymentDataSource(this._networkService);
Future<ApiResponse<String>> getPaymentUrl({
  required String quickOrderId,
  required String language,
}) async {
  try {
    final response = await _networkService.get(
      EndPoints.getPaymentUrl,
      queryParameters: {
        'quick_order_id': quickOrderId,
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

}
