import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ahtizam/src/constants/dotenv_keys.dart';

class ServicesUrls {
  static String prodBaseUrl = '';
  static String devBaseUrl = '';
  static String imageUrl = '';
  static String socketUrl = '';
  static String mapApiKey = '';
  static void init() {
    prodBaseUrl = dotenv.get(DotenvKeys.prodBaseUrl);
    devBaseUrl = dotenv.get(DotenvKeys.devBaseUrl);
    imageUrl = dotenv.get(DotenvKeys.imageUrl);
    socketUrl = dotenv.get(DotenvKeys.socketIoUrl);
    mapApiKey = dotenv.get(DotenvKeys.mapApiKey);
    debugPrint('mnor $prodBaseUrl');
  }

}
