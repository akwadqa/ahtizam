// 📄 auth_remote_datasource.dart
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

import '../../domain/entity/login_params.dart';
import '../../domain/entity/signup_params.dart';

class AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSource(this._networkService);

   Future<Map<String, dynamic>> login(LoginParams params) async {
    final response = await _networkService.post(
      EndPoints.loginApi,
      data: params.toJson(),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> signup(SignupParams params) async {
    final response = await _networkService.post(
      EndPoints.registerApi,
      data: params.toJson(),
    );
    return response.data;
  }
}
