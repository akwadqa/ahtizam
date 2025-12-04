
import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/wallet/data/data_source/wallet_remote_data_source.dart';
import 'package:ahtizam/src/features/wallet/domain/model/wallet_model.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'wallet_repository.g.dart';

@Riverpod(keepAlive: true)
WalletRepository walletRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return WalletRepository(WalletRemoteDataSource(networkService));
}
class WalletRepository {
  final WalletRemoteDataSource _remoteDataSource;

  WalletRepository(this._remoteDataSource);

  Future<ApiResponse<WalletModel>> getWalletData(int page) async {
    try {
      final response = await _remoteDataSource.getWalletData(page);

      if (response.status == 200 && response.data != null) {
        return response;
      } else {
        throw AppException('Failed to fetch wallet data. Status: ${response.status}');
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<String> getWalletRequestIdUrl({
    required String amount,
  }) async {
    try {
      final result = await _remoteDataSource.getWalletRequestId(amount: amount);

      if (result.status == 200 && result.data != null) {
        return result.data!;
      } else {
        throw AppException('Failed to get wallet request ID. Status: ${result.status}');
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
