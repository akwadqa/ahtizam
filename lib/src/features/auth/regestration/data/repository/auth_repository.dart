// 📄 auth_repository.dart
import 'package:ahtizam/src/features/auth/regestration/data/data_source/auth_remote_data_source.dart';
import 'package:ahtizam/src/features/auth/regestration/domain/entity/login_params.dart';
import 'package:ahtizam/src/features/auth/regestration/domain/entity/signup_params.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return AuthRepository(AuthRemoteDataSource(networkService));
}

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource);

  Future<String> _handleAuthResponse(Map<String, dynamic> responseData) async {
    final int? statusCode = responseData['status_code'];
    final String? message = responseData['message'];

    if (statusCode == 200) {
      return message ?? '';
    } else {
      throw Exception(message ?? "An unknown error occurred");
    }
  }

  Future<String> login(LoginParams params) async {
    final response = await _remoteDataSource.login(params);
    return await _handleAuthResponse(response);
  }

  Future<String> signup(SignupParams params) async {
    final response = await _remoteDataSource.signup(params);
    return await _handleAuthResponse(response);
  }
}
