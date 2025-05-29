import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/home/domain/models/passenger_coordinates_params.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_details_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSource {
  final NetworkService _networkService;

  HomeRemoteDataSource(this._networkService);

  Future<ApiResponse<QuickOrderModel>> createQuickOrder(PassengerCoordinatesParams coordinates,String email) async {
    try{
    final Response response = await _networkService.post(
      EndPoints.quickOrderApi,
      data: {
        'passenger_coordinates': coordinates.toJson(),
        'passenger_email': email,
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

  Future<ApiResponse<QuickOrderDetailsModel>> getQuickOrderDetails(String quickOrderId) async {
  try{
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
    }  }
}
