import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/constants/Api/end_points.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_data_params.dart';
import 'package:ahtizam/src/network/services/network_service.dart';

import '../../domain/model/profile_model.dart';

class ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSource(this._networkService);

  

  Future<ApiResponse<ProfileModel>> getProfileData() async {
    final response = await _networkService.get(
      EndPoints.profileDataApi,
      queryParameters: {
        "action":"passenger"
      }
    );
    return response.data;
  }

  Future<ApiResponse<ProfileModel>> updateProfileData(ProfileDataParams profile) async {

    final response = await _networkService.put(
      EndPoints.profileDataApi,
      data: profile.toMap(),
      queryParameters: {
        "action":"passenger"
      }
    );
    return response.data;
  }
}
