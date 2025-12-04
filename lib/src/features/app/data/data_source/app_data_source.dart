import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/app/domain/model/version/version_update.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

class AppRemoteDataSource {
  final NetworkService _networkService;

  AppRemoteDataSource(this._networkService);

  Future<ApiResponse<VersionUpdate>> checkApiVersion() async {
    try {
      final response = await _networkService.get(
        EndPoints.checkVersionApi,
        queryParameters: {"action": "passenger"},
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => VersionUpdate.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
