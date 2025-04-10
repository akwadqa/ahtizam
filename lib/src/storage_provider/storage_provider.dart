import 'package:ahtizam/src/configs/hive_configs/hive_boxes.dart';
import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:hive/hive.dart';

import '../configs/hive_configs/hive_initializer.dart';

abstract class StorageProvider {
  Future<void> init();
  Future<void> saveUser(UserInformation user);
  Future<UserInformation?> getUser();
  Future<void> clearUser();
}

class HiveStorageRepository implements StorageProvider {
  @override
  Future<void> init() async {
    await HiveInitializer.initialize();
  }

  @override
  Future<void> saveUser(UserInformation user) async {
    final box = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
    await box.put(0, user);
  }

  @override
  Future<UserInformation?> getUser() async {
    final box = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
    return box.get(0);
  }

  @override
  Future<void> clearUser() async {
    final box = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
    await box.clear();
  }
}
