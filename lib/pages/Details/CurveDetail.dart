import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DetailCurve extends CustomPainter {
  String color1, color2;
  DetailCurve({this.color1, this.color2});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.13),
        Offset(size.width, size.height * 0.13),
        [Color(int.parse(color1)), Color(int.parse(color2))],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.26);
    path_0.quadraticBezierTo(size.width * 0.65, size.height * 0.18,
        size.width * 0.50, size.height * 0.18);
    path_0.quadraticBezierTo(
        size.width * 0.35, size.height * 0.17, 0, size.height * 0.26);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
