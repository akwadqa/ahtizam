import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/home/domain/models/coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/service_types/service_types_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';

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
          if (couponCode != null) "coupun_code": couponCode, 
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

  // Future<List<String>> getPendingOffers() async {
  //   final response = await _networkService.get(EndPoints.pendingOffers);
  //   final offers = response.data['data'] as List;
  //   return offers.map((e) => e['quick_order_offer_id'].toString()).toList();
  // }

  // Future<bool> respondToOffer(String offerId, {bool accept = true}) async {
  //   final response = await _networkService.put(
  //     EndPoints.respondToOffer,
  //     data: {
  //       'offer_id': offerId,
  //       'response': accept ? 'accepted' : 'rejected',
  //     },
  //   );
  //   return response.data['error'] == 0;
  // }

  Future<ApiResponse<QuickOrderDetailsModel>> getQuickOrderDetails(
      String quickOrderId) async {
    try {
      final response = await _networkService.get(
        EndPoints.quickOrderDetailsApi,
        queryParameters: {'quick_order_id': quickOrderId},
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => QuickOrderDetailsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<List<ServiceTypesModel>>> getServiceTypes(
      ) async {
    try {
      final response = await _networkService.get(
        EndPoints.serviceTypes,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) => ServiceTypesModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }



}
