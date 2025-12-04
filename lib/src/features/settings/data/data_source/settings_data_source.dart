import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/settings/domain/model/settings_data_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:flutter/material.dart';


class SettingsDataSource {
  final NetworkService _networkService;

  SettingsDataSource(this._networkService);


Future<ApiResponse<SettingsDataModel>> getSettingsData() async {
    try {
      final response = await _networkService.get(EndPoints.settingsApi,
);

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load profile data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => SettingsDataModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getProfileData: $e');
      rethrow;
    }
  }
}
