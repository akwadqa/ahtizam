import 'dart:io';

import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/home/data/datasources/home_data_source.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/service_types/service_types_model.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return HomeRepository(HomeRemoteDataSource(networkService));
}

class HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);

  // Create a new order
  Future<ApiResponse<QuickOrderModel>> createQuickOrder({
    required CoordinatesParams passengerCoordinates,
    required CoordinatesParams destinationCoordinates,
    required String searviceItemId,
    String? couponCode,
    required String email,
  }) async {
    try {
      final result = await _remoteDataSource.createQuickOrder(
        passengerCoordinates,
        destinationCoordinates,
        email,
        searviceItemId,
        couponCode,
      );

      if (result.status == 200) {
        return result;
      } else {
        return ApiResponse<QuickOrderModel>.error(
            message: result.message ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  Future<ApiResponse<QuickOrderModel>> processQuickOrder({
    required String quickOrderId,
    required String paymentMethod,
    required File? mapImage,
  }) async {
    try {
      final result = await _remoteDataSource.proccessQuickOrder(
        quickOrderId,
        paymentMethod,
        mapImage,
      );

      if (result.status == 200) {
        // if(result.error==1){
        //   return ApiResponse<QuickOrderModel>.error(
        //     message: result.message ?? 'No Drivers');
        // }
        return result;
      } else {
        return ApiResponse<QuickOrderModel>.error(
            message: result.message ?? 'Unknown error');
      }
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  Future<ApiResponse<List<ServiceTypesModel>>> getServiceTypes() async {
    try {
      final result = await _remoteDataSource.getServiceTypes();
      if (result.hasFailed) {
        throw Exception(
          result.message ?? 'Failed to fetch service types',
        );
      }
      // if (result.status == 200) {
      return result;
      // }
    } catch (e) {
      throw Exception('❌ Failed to Get Service Types: $e');
    }
  }
}
