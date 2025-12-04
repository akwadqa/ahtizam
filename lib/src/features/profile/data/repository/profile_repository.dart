import 'package:ahtizam/src/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_data_params.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_model.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return ProfileRepository(ProfileRemoteDataSource(networkService));
}

class ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepository(this._remoteDataSource);

  Future<ProfileModel> getProfileData() async {
    final response = await _remoteDataSource.getProfileData();
    if (response.status == 200) {
      return response.data!;
    }
    throw AppException(response.message);
  }

  Future<ProfileModel> updateProfileData(ProfileDataParams params) async {
    final response = await _remoteDataSource.updateProfileData(params);
    if (response.status == 200) {
      return response.data!;
    }
    throw AppException(response.message);
  }

  Future<bool> deleteAccount() async {
    final response = await _remoteDataSource.deleteAccount();
    if (response.status == 200) {
      return response.data ?? false;
    }
    throw AppException(response.message);
  }
}
