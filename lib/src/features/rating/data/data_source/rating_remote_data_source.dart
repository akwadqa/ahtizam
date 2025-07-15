import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/rating/domain/rating_params.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class RatingRemoteDataSource {
  final NetworkService _networkService;

  RatingRemoteDataSource(this._networkService);

  

  Future<ApiResponse> ratingDriver(
      RatingParams ratingParams) async {
    try {
      final formData = FormData.fromMap(ratingParams.toJson());

      final response = await _networkService
          .post(EndPoints.ratingApi, data: formData );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to Rate');
      }

        return ApiResponse.fromJson(response.data, (_) => null);
    } catch (e) {
      debugPrint('Error in Rate $e');
      rethrow;
    }
  }
}
