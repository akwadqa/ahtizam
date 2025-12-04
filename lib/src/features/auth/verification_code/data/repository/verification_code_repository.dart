import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:ahtizam/src/features/auth/verification_code/data/data_source/verification_code_data_source.dart';
import 'package:ahtizam/src/features/auth/verification_code/domain/model/verification_code_params.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../constants/Api/api_response.dart';

part 'verification_code_repository.g.dart';

@Riverpod(keepAlive: true)
VerificatonCodeRepository verificatonCodeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return VerificatonCodeRepository(VerificationCodeDataSource(networkService));
}
class VerificatonCodeRepository {
  final VerificationCodeDataSource _remoteDataSource;

  VerificatonCodeRepository(this._remoteDataSource);

  Future<ApiResponse<UserInformation>> _handleResponse(
      Map<String, dynamic> responseData) async {
    if (responseData.containsKey('status_code') &&
        responseData['status_code'] == 200) {
      if (responseData.containsKey('data')) {
        final userData = UserInformation.fromJson(responseData['data']);

        return ApiResponse.success(
            message: "OTP verification successful", data: userData); //
      } else {
        throw Exception("Token missing in response");
      }
    } else {
      throw Exception(responseData['message'] ?? "OTP verification failed");
    }
  }

  Future<ApiResponse<UserInformation>> verificatonCode(VerificationCodeParams params
  ) async {
      final response = await _remoteDataSource.verificatonCode(params);
    return await _handleResponse(response);
  }
}
