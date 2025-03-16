// import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../localization/current_language.dart';

extension IntFormatting on int {
  /// Formats the number with K, M, B for thousands, millions, and billions respectively.
  String get formatted {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}B';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return toString();
    }
  }

  /// Add currency (Requires `ref` to get current language)
  String withCurrency(WidgetRef ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);
    final formatter =
        NumberFormat.decimalPattern(currentLanguage == 'ar' ? 'ar' : 'en');

    return currentLanguage == 'ar'
        ? '${formatter.format(this)} ر.ق'
        : '${formatter.format(this)} QAR';
  }
}

extension DoubleToValues on double {
  /// Convert double to radius values
  Radius get toRadius {
    return Radius.circular(this);
  }

  String withDistance(WidgetRef ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);
    return currentLanguage == 'ar' ? '$this كم' : '$this km';
  }
}

extension DoubleFormatting on double {
  /// Add currency (Requires `ref`)
  String withCurrency(WidgetRef ref) {
    final currentLanguage = ref.watch(currentLanguageProvider);
    final formatter =
        NumberFormat.decimalPattern(currentLanguage == 'ar' ? 'ar' : 'en');

    return currentLanguage == 'ar'
        ? '${formatter.format(this)} ر.س'
        : '${formatter.format(this)} SAR';
  }

  String toCommaSeparated({String locale = 'en'}) {
    final formatter = NumberFormat.decimalPattern(locale);
    return formatter.format(this);
  }
}

extension IntToValues on int {
  /// Convert double to radius values
  Radius get toRadius {
    return Radius.circular(toDouble());
  }
}

extension DistanceFormatting on double {
  String toDistanceString() {
    if (this < 1000) {
      return '${toStringAsFixed(2)} m';
    } else {
      return '${(this / 1000).toStringAsFixed(2)} km';
    }
  }
}
