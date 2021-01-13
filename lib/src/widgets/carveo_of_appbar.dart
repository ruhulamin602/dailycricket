import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// In your paint method

class AppbarCustomPainter extends CustomPainter {
  final double height;
  final double peak;
  Color _color1 = Color.fromRGBO(5, 104, 71, 1);
  Color _color2 = Color.fromRGBO(42, 163, 107, 1);

  AppbarCustomPainter(this.height, this.peak);
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final rect = Offset.zero & size;

    Paint paint = new Paint()
      // ..color = Color.fromRGBO(27, 140, 93, 1)
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        rect.centerLeft,
        rect.centerRight,
        [
          _color1,
          _color2,
        ],
      );

    Path path = Path();
    path.moveTo(0, 0); // Start
    // path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    // path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.lineTo(0, size.height + height);
    path.quadraticBezierTo(
        size.width / 2, size.height + peak, size.width, size.height + height);

    path.lineTo(size.width, 0);

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
