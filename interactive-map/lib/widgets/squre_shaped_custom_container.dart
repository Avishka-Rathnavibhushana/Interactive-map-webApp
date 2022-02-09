import 'package:flutter/material.dart';

class SqureShapedCustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xFF131438)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2291667, size.height * 0.2857143);
    path0.lineTo(0, size.height * 0.2857143);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.2500000, 0);
    path0.lineTo(size.width * 0.2500000, size.height * 0.2428571);
    path0.lineTo(size.width * 0.2291667, size.height * 0.2857143);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
