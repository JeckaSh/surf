import 'package:flutter/material.dart';

/// Отрисовщик окружности с вариативной заливкой цветом
class CirclePainter extends CustomPainter {
  final Color color;

  final bool isFill;

  const CirclePainter({required this.color, this.isFill = false});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = isFill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
