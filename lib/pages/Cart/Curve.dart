import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.80),
        Offset(size.width, size.height * 0.80),
        [Color(0xfff8f8f8), Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.81, size.width, size.height * 0.74);
    path_0.cubicTo(size.width * 0.93, size.height * 0.69, size.width * 0.85,
        size.height * 0.63, size.width * 0.72, size.height * 0.60);
    path_0.cubicTo(size.width * 0.60, size.height * 0.59, size.width * 0.41,
        size.height * 0.58, size.width * 0.30, size.height * 0.60);
    path_0.quadraticBezierTo(
        size.width * 0.17, size.height * 0.61, 0, size.height * 0.74);
    path_0.lineTo(0, size.height);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
