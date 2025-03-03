import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:standard_project/src/constants/Api/services_urls.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

abstract class AppInitializer {
  static init() async {
    //-- Flutter init --
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    //-- ENV FILE LOAD  --
    await dotenv.load(fileName: '.env');
    //-- Load base URL's  --
    ServicesUrls.init();
    await EasyLocalization.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //-- Localization init  --
    await EasyLocalization.ensureInitialized();
  }
}
