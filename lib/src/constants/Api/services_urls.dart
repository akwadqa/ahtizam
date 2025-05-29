import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ahtizam/src/constants/dotenv_keys.dart';

class ServicesUrls {
  static String baseUrl = '';
  static String imageUrl = '';
  static String socketUrl = '';
  static String mapApiKey = '';
  static init() {
    baseUrl = dotenv.get(DotenvKeys.baseUrl);
    imageUrl = dotenv.get(DotenvKeys.imageUrl);
    socketUrl = dotenv.get(DotenvKeys.socketIoUrl);
    mapApiKey = dotenv.get(DotenvKeys.mapApiKey);
    debugPrint('mnor $baseUrl');
  }

}
