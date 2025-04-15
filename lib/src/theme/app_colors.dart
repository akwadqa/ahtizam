import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFFE6BB3B);
  static const Color lightPrimary = Color(0xFFEBC862);
  static const Color orange = Color(0xFFFE9D02);
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFEBC86299, // Base color
    <int, Color>{
      0: primary,
      50: Color(0xFFEBC862),
      100: Color(0xFFE6BB3B),
      200: Color(0xFFD9B138),
      300: Color(0xFFD0A733),
      400: Color(0xFFC79D30),
      500: Color(0xFFC0932D),
      600: Color(0xFFB8892A),
      700: Color(0xFFB07F27),
      800: Color(0xFFA87524),
      900: Color(0xFF9F6B21),
    },
  );
  static const Color lightGray = Color(0xFFE5E5E5);
  static const Color lighterGray = Color(0xFFF1F1F1);
  static const Color lightestGray = Color(0xFFD9D9D9);
  static const Color mediumGray = Color(0xFFD7D7D7);
  static const Color grayBorder = Color(0xFFCCCCCC);
  static const Color border = Color(0xFFF0F5FA);
  static const Color gray = Color(0xFFAAAAAA);
  static const Color stoneGray = Color(0xFF949494);
  static const Color grey600 = Color(0xFF757575);
  static const Color darkGray = Color(0xFF888888);
  static const Color darkerGray = Color(0xFF727272);
  static const Color dimGray = Color(0xFF555555);
  static const Color grayishCharcoal = Color(0xFF595959);
  static const Color fillGrey = Color(0xFFEBEBEB);
  static const Color replayGrey = Color(0xFFF4F4F3);

  static const Color black800 = Color(0xFF444444);
  static const Color black900 = Color(0xFF484848);
  static const Color black = Color(0xFF000000);
  static const Color dark = Color(0xFF201C11);

  static const Color rose = Color(0xFFF8D5CC);
  static const Color darkRed = Color(0xFFBC0000);
  static const Color newRed = Color(0xFFD75966);

  static const Color green = Color(0xFF69A94B);
  static const Color lightBlue = Color(0xFFF8FAFC);

  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF6F6F6);
  static const Color halfWhite = Color(0xFFF6F6F6);
  static const Color halfPrimary = Color(0xFFFFFF8F);
  static const Color lightPeach = Color(0xFFFEFBF5);
  static const Color nevy = Color(0xFF475569);
}
