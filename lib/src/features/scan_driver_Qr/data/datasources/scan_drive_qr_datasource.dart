import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/domain/model/driver_info_model.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class ScanDriveQrDatasource {
  final NetworkService _networkService;

  ScanDriveQrDatasource(this._networkService);

  Future<ApiResponse<DriverInfoModel>> fetchByDriverId(String driverId) async {
    try {
      final response = await _networkService.get(
        EndPoints.profileDataApi,
        queryParameters: {'driver_id': driverId, 'action': "driver"},
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => DriverInfoModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
