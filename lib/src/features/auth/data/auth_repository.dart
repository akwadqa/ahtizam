import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/end_points.dart';
import '../../../network/network_service.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepository(ref.watch(networkServiceProvider()));

class AuthRepository {
  final NetworkService _networkService;

  AuthRepository(this._networkService);

  Future<(String authToken, String userId)> _handleAuthResponse(
      Map<String, dynamic> responseData) async {
    if (responseData.containsKey('complete_auth_token') &&
        responseData.containsKey('user_id')) {
      final String authToken = responseData['complete_auth_token'];
      final String userId = responseData['user_id'];
      return (authToken, userId);
    } else {
      throw AppException(responseData['message']);
    }
  }

  Future<(String authToken, String userId)> login(String phone) async {
    final response = await _networkService.post(EndPoints.loginApi, {
      'phone_number': phone,
    });

    return _handleAuthResponse(response.data);
  }

  Future<(String authToken, String userId)> signup(
      String email,
      String username,
      String password,
      String confirmPassword,
      String phone) async {
    final response = await _networkService.post(EndPoints.signUpApi, {
      'email': email,
      'firstname': username.split(' ').first,
      'lastname': username.split(' ').last,
      'password1': password,
      'password2': confirmPassword,
      'phone': phone,
    });

    return _handleAuthResponse(response.data);
  }
}
