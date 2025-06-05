import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
String processEtaValue(String? etaResponse, int mode) {
  if (etaResponse == null || etaResponse.isEmpty) return '';

  final parts = etaResponse.split(',');

  if (parts.length != 2) return '';

  final distanceMeters = int.tryParse(parts[0].trim());
  final timeMinutes = int.tryParse(parts[1].trim());

  if (mode == 1 && distanceMeters != null) {
    // Distance: show in meters if < 1000, else km
    if (distanceMeters < 1000) {
      return '$distanceMeters ${'unit_m'.tr()}';
    } else {
      final km = (distanceMeters / 1000).toStringAsFixed(1);
      return '$km ${'unit_km'.tr()}';
    }
  } else if (mode == 2 && timeMinutes != null) {
    return '$timeMinutes ${'unit_min'.tr()}';
  }

  return '';
}


