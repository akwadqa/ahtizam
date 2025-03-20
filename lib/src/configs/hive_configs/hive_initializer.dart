import 'package:ahtizam/src/configs/hive_configs/hive_boxes.dart';
import 'package:ahtizam/src/configs/hive_configs/hive_type_ids.dart';
import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveInitializer {
  static Future<void> initialize() async {
    debugPrint('Initializing Hive...');

    try {
      // Initialize Hive with correct directory for non-web platforms
      if (!kIsWeb) {
        var documentsDirectory = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(documentsDirectory.path);
      } else {
        await Hive.initFlutter();
      }

      // Helper method to check adapter registration
      bool isNotRegistered(int typeId) {
        return !Hive.isAdapterRegistered(typeId);
      }

      // Register Adapters
      if (isNotRegistered(HiveTypeIds.userInfoTypId)) {
        Hive.registerAdapter(
            UserInformationAdapter()); // ✅ Corrected Registration
      }

      // Open Boxes
      await Hive.openBox<UserInformation>(HiveBoxesName.userInfoBox);

      debugPrint('✅ Hive Initialized Successfully');
    } catch (e) {
      debugPrint('❌ HiveInitializer Error: $e');
    }
  }
}
