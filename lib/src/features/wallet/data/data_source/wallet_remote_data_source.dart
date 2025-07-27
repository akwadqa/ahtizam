import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/wallet/domain/model/wallet_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:flutter/material.dart';

class WalletRemoteDataSource {
  final NetworkService _networkService;

  WalletRemoteDataSource(this._networkService);

  Future<ApiResponse<WalletModel>> getWalletData(int page) async {
    try {
      final response = await _networkService.get(
        EndPoints.walletHistoryDataApi,
        queryParameters: {"page":page,"action":"passenger"}
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load Wallet data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => WalletModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in Wallet: $e');
      rethrow;
    }
  }

  Future<ApiResponse<String>> getWalletRequestId({required String amount}) async {
    try {
      // final formData = FormData);

      final response = await _networkService.post(
        EndPoints.getWalletRequestId,
        data: {"amount": amount,"action":"passenger"},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load wallet data');
      }

      final url = response.data?['data']?['digital_wallet_request_id'];
      if (url == null) {
        return ApiResponse.error(message: "No wallet request ID found. URL returned.");
      }

      return ApiResponse.success(data: url, message: response.data['message']);
    } catch (e) {
      debugPrint('Error in  wallet request ID update: $e');
      rethrow;
    }
  }
}
