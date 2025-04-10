import 'package:ahtizam/src/configs/hive_configs/hive_boxes.dart';
import 'package:ahtizam/src/configs/hive_configs/hive_type_ids.dart';
import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveInitializer {
  static Future<void> initialize() async {
    debugPrint('Initializing Hive...');
    // await Hive.deleteFromDisk();

    try {
      // Initialize Hive with correct directory for non-web platforms
      if (!kIsWeb) {
        var documentsDirectory = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(documentsDirectory.path);
      }
      await Hive.initFlutter();

      _registerAdapters();

      await _openBoxes();

      debugPrint('✅ Hive Initialized Successfully');
    } catch (e) {
      debugPrint('❌ HiveInitializer Error: $e');
    }
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeIds.userInfoTypId)) {
      Hive.registerAdapter(UserInformationAdapter());
    }
  }

  static Future<void> _openBoxes() async {
    await Future.wait([
      Hive.openBox<UserInformation>(HiveBoxesName.userInfoBox),
    ]);
  }
}
