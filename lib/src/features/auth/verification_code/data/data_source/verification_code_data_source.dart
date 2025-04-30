// 📄 auth_remote_datasource.dart
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

import '../../domain/model/verification_code_params.dart';



class VerificationCodeDataSource {
  final NetworkService _networkService;

  VerificationCodeDataSource(this._networkService);

   Future<Map<String, dynamic>> verificatonCode(VerificationCodeParams params) async {
    final response = await _networkService.post(
      EndPoints.verificationCodeApi,
      data: params.toJson(),
    );
    return response.data;
  }
}
