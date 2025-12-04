import 'dart:math';

import 'package:auto_route/auto_route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<T> retryOperation<T>(Future<T> Function() operation,
    {int maxAttempts = 3}) async {
  int attempts = 0;
  while (attempts < maxAttempts) {
    try {
      return await operation();
    } catch (e) {
      attempts++;
      print('Operation failed (attempt $attempts): $e');
      if (attempts >= maxAttempts) rethrow;
      // Exponential backoff
      await Future.delayed(
          Duration(milliseconds: pow(2, attempts).toInt() * 500));
    }
  }
  throw Exception('Failed after $maxAttempts attempts');
}
bool isRTL(String text) {
  final rtlRegex = RegExp(r'^[\u0600-\u06FF]');
  return rtlRegex.hasMatch(text.trim());
}


Future<void> safelyPop(BuildContext context) async {
  FocusScope.of(context).unfocus();
  await Future.delayed(const Duration(milliseconds: 100));
  if (context.mounted) context.maybePop();
}

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpacing;

  const DottedDivider({
    this.height = 1,
    this.color = Colors.black26,
    this.dashWidth = 5,
    this.dashSpacing = 3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(
        color: color,
        dashWidth: dashWidth,
        dashSpacing: dashSpacing,
        height: height,
      ),
      size: Size(double.infinity, height),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpacing;
  final double height;

  _DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpacing,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
