import 'package:flutter/material.dart';

/// **Draws Circles & Dotted Line**
class DottedPathWithCircles extends StatelessWidget {
  const DottedPathWithCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(),
      child: const SizedBox.expand(),
    );
  }
}

/// **Custom Painter for Dotted Line & Circles**
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()..color = Colors.black;
    final Paint circlePaintYellow = Paint()..color = Colors.amber;

    final double circleRadius = 6;
    final Offset topCircle = Offset(10, size.height * 0.25);
    final Offset bottomCircle = Offset(10, size.height * 0.75);

    canvas.drawCircle(topCircle, circleRadius, circlePaint);
    canvas.drawCircle(bottomCircle, circleRadius, circlePaintYellow);

    final Paint dottedLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashWidth = 2, dashSpace = 2;
    double startY = topCircle.dy + circleRadius + dashSpace;
    final double endY = bottomCircle.dy - circleRadius - dashSpace;

    while (startY < endY) {
      canvas.drawLine(
          Offset(10, startY), Offset(10, startY + dashWidth), dottedLinePaint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
