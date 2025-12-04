import 'package:ahtizam/src/features/settings/data/repository/settings_repository.dart';
import 'package:ahtizam/src/features/settings/domain/model/settings_data_model.dart';
import 'package:ahtizam/src/network/exception/dio_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<SettingsDataModel?> build() async {
    getSettingsData();
// return null;
    return state.value;
  }

  Future<void> getSettingsData() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(settingsRepositoryProvider).getSettingsData();
      (err) => AppException(err);

      return result;
    });
  }
}
