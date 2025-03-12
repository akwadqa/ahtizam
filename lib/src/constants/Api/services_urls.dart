import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:standard_project/src/constants/Api/dotenv_keys.dart';

class ServicesUrls {
  static String baseUrl = '';
  static String mapApiKey = '';
  static init() {
    baseUrl = dotenv.get(DotenvKeys.baseUrl);
    mapApiKey = dotenv.get(DotenvKeys.mapApiKey);
    debugPrint('mnor $baseUrl');
  }

  // //!Development
  // static const String domain = 'https://domain.com';

  // // !Production

  // static const String baseUrl = 'https://ehtezam.akwad.qa/';
}
