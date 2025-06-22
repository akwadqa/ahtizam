import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/payment/data/datasources/payment_data_source.dart';

import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

Future<ApiResponse<String>> getPaymentUrl({
  required String quickOrderId,
  required String language,
}) async {
  final result = await _remoteDataSource.getPaymentUrl(
    quickOrderId: quickOrderId,
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

}
