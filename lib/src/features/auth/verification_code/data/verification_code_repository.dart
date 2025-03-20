import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/Api/api_response.dart';
import '../../../../constants/Api/end_points.dart';
import '../../../../network/network_service.dart';

part 'verification_code_repository.g.dart';

@Riverpod(keepAlive: true)
VerificatonCodeRepository verficationRepository(Ref ref) =>
    VerificatonCodeRepository(ref.watch(networkServiceProvider()));

class VerificatonCodeRepository {
  final NetworkService _networkService;

  VerificatonCodeRepository(this._networkService);

  /// **✅ Corrected Response Handling**
  Future<ApiResponse<UserInformation>> _handleResponse(
      Map<String, dynamic> responseData) async {
    if (responseData.containsKey('status_code') &&
        responseData['status_code'] == 200) {
      if (responseData.containsKey('data')) {
        // ✅ Convert responseData['data'] to UserInformation
        final userData = UserInformation.fromJson(responseData['data']);

        return ApiResponse.success(
            message: "OTP verification successful",
            data: userData); // ✅ Return wrapped ApiResponse
      } else {
        throw Exception("Token missing in response");
      }
    } else {
      throw Exception(responseData['message'] ?? "OTP verification failed");
    }
  }

  /// **✅ Fixed Response Type**
  Future<ApiResponse<UserInformation>> verificatonCode(
    String otp,
    String phone,
  ) async {
    final response = await _networkService.post(EndPoints.verificationCodeApi, {
      'otp': otp,
      'action': "passenger",
      'mobile_no': phone,
    });

    debugPrint("response.data.toString()");
    debugPrint(response.data.toString());
    debugPrint("******************");

    return await _handleResponse(response.data); // ✅ Ensure correct return type
  }
}
