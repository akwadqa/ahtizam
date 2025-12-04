import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/app/data/data_source/app_data_source.dart';
import 'package:ahtizam/src/features/app/domain/model/version/version_update.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_repository.g.dart';

@Riverpod(keepAlive: true)
AppRepository appRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return AppRepository(AppRemoteDataSource(networkService));
}

class AppRepository {
  final AppRemoteDataSource _remoteDataSource;

  AppRepository(this._remoteDataSource);

    Future<ApiResponse<VersionUpdate>> checkAppVersion() async {
    try {
      final result = await _remoteDataSource.checkApiVersion();
      if (result.hasFailed) {
        throw AppException(
          result.message ?? 'Failed to checkApiVersion',
        );
      }
      // if (result.status == 200) {
      return result;
      // }
    } catch (e) {
      throw AppException('❌ Failed to checkApiVersion: $e');
    }
  }
}
