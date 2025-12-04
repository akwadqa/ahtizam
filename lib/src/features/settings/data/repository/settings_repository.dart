
import 'package:ahtizam/src/features/settings/data/data_source/settings_data_source.dart';
import 'package:ahtizam/src/features/settings/domain/model/settings_data_model.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'settings_repository.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return SettingsRepository(SettingsDataSource(networkService));
}

class SettingsRepository {
  final SettingsDataSource _remoteDataSource;

  SettingsRepository(this._remoteDataSource);

  

  Future<SettingsDataModel> getSettingsData() async {
    final response = await _remoteDataSource.getSettingsData();
    if(response.status==200){
    return  response.data!;

    }
    throw AppException(response.message);

  }
  
}
