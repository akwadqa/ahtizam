import 'package:ahtizam/firebase_options.dart';
import 'package:ahtizam/src/configs/hive_configs/hive_initializer.dart';
import 'package:ahtizam/src/core/notifications/services/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AppInitializer {
  static Future<void> init() async {
    //-- Flutter init --
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    
    // -- FIREBASE INIT -- //
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // -- Initialize Notifications -- //
    final container = ProviderContainer();
    await container.read(notificationServiceProvider).initialize();
    
    //-- ENV FILE LOAD  --
    await dotenv.load(fileName: '.env');
    //-- Hive initialize --
    await Hive.initFlutter();
    await HiveInitializer.initialize();
    
    //-- Load base URL's  --
    ServicesUrls.init();
    
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //-- Localization init  --
    await EasyLocalization.ensureInitialized();
  }
}
