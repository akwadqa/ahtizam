import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/payment/data/datasources/payment_data_source.dart';

import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return PaymentRepository(PaymentDataSource(networkService));
}

class PaymentRepository {
  final PaymentDataSource _remoteDataSource;

  PaymentRepository(this._remoteDataSource);
Future<ApiResponse<void>> payBySadad({
  required String orderId,
  required String token,
  required String method,
}) async {
  final result = await _remoteDataSource.payBySadad(
    orderId: orderId,
    token: token,
    method: method,
  );

  if (result.hasSucceeded) {
    return result;
  } else {
    return ApiResponse.error(message: result.message ?? 'Sadad payment failed');
  }
}

Future<ApiResponse<String>> getPaymentUrl({
  required String orderId,
  required String language,
}) async {
  final result = await _remoteDataSource.getPaymentUrl(
    orderId: orderId,
    language: language,
  );

  if (result.status == 200) {
    return result;
  } else {
    return ApiResponse.error(message: result.message ?? 'Payment URL failed');
  }
}

Future<ApiResponse<void>> confirmPayment() async {
  final result = await _remoteDataSource.confirmPayment();

  if (result.status == 200) {
    return result;
  } else {
    return ApiResponse.error(
        message: result.message ?? 'Failed to confirm payment');
  }
}

Future<ApiResponse<void>> payByWallet({
  required String orderId,

}) async {
  final result = await _remoteDataSource.payByWallet(
    orderId: orderId
  );

  if (result.hasSucceeded) {
    return result;
  } else {
    return ApiResponse.error(
        message: result.message ?? 'Failed to confirm payment');
  }
}

}
