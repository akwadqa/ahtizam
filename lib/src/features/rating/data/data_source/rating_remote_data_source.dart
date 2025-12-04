import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/rating/domain/rating_params.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RatingRemoteDataSource {
  final NetworkService _networkService;

  RatingRemoteDataSource(this._networkService);

  Future<ApiResponse> ratingDriver(RatingParams ratingParams) async {
    try {
//        ╟ driver_id: DR-25-1046
// I/flutter ( 9892): ╟ rating: 2
// I/flutter ( 9892): ╟ reference_doctype: Quick Order
// I/flutter ( 9892): ╟ reference_name: QO251159
// final ii=RatingParams(driverId: "DR-25-1046", rating: "2",referenceDoctype: "Quick Order", referenceName: "QO251159");
      final formData = FormData.fromMap(ratingParams.toJson());

      final response =
          await _networkService.post(EndPoints.ratingApi, data: formData);

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to Rate');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (_) => null,
      );
    } catch (e) {
      debugPrint('Error in Rate $e');
      rethrow;
    }
  }
}
