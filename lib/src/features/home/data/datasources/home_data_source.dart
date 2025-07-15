import 'dart:io';

import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/service_types/service_types_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRemoteDataSource {
  final NetworkService _networkService;

  HomeRemoteDataSource(this._networkService);

  Future<ApiResponse<QuickOrderModel>> createQuickOrder(
      CoordinatesParams passengerCoordinates,
      CoordinatesParams destinationCoordinates,
      String email,
      String serviceItemId,
      String? couponCode) async {
    try {
      final Response response = await _networkService.post(
        EndPoints.quickOrderApi,
        data: {
          'passenger_coordinates': passengerCoordinates.toJson(),
          'destination_coordinates': destinationCoordinates.toJson(),
          'service_type': serviceItemId,
          'passenger_email': email,
          if (couponCode != null) "coupon_code": couponCode,
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => QuickOrderModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

 Future<ApiResponse<QuickOrderModel>> proccessQuickOrder(
  String quickOrderId,
  String? driverId,
  String paymentMethod,
  File? mapScreenshotFile,
) async {
  try {
    // Prepare multipart form data
    final formData = FormData.fromMap({
      'quick_order_id': quickOrderId,
     if(driverId!=null) 'driver_id': driverId,
      'payment_method': paymentMethod,
      if (mapScreenshotFile != null)
        'map_image_file': await MultipartFile.fromFile(
          mapScreenshotFile.path,
          filename: 'map_image${DateTime.now()}.png',
        ),
    });

    final Response response = await _networkService.post(
      EndPoints.processQuickOrderApi,
      data: formData,
    );

    return ApiResponse.fromJson(
      response.data,
      (json) => QuickOrderModel.fromJson(json as Map<String, dynamic>),
    );
  } catch (e) {
    return ApiResponse.error(message: e.toString());
  }
}

  Future<ApiResponse<List<ServiceTypesModel>>> getServiceTypes() async {
    try {
      final response = await _networkService.get(
        EndPoints.serviceTypes,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                ServiceTypesModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
