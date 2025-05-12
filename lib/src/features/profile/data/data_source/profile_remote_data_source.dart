import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_data_params.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/model/profile_model.dart';

class ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSource(this._networkService);

  Future<ApiResponse<ProfileModel>> getProfileData() async {
    try {
      final response = await _networkService.get(EndPoints.profileDataApi,
          queryParameters: {"action": "passenger"});

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load profile data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ProfileModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getProfileData: $e');
      rethrow;
    }
  }

  Future<ApiResponse<ProfileModel>> updateProfileData(
      ProfileDataParams profile) async {
    try {
      final formData = FormData.fromMap(profile.toMap());

      final response = await _networkService
          .put(EndPoints.profileDataApi, data: formData, headers: {
        'Content-Type': 'multipart/form-data',
      }, queryParameters: {
        "action": "passenger"
      });

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load profile data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ProfileModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in profile update: $e');
      rethrow;
    }
  }
}
