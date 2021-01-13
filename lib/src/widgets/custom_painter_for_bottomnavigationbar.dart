
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color.fromRGBO(27, 140, 93, 1)
      ..style = PaintingStyle.fill..strokeWidth=1.0;

    Path path = Path();
    path.moveTo(0, 20); // Start
    // path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    // path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width / 2, -25, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path.shift(Offset(0,-4)), Colors.grey[200].withAlpha(100), 0, true);
    canvas.drawShadow(path.shift(Offset(0,-2)), Colors.grey[200].withAlpha(200), 0, true);
    canvas.drawShadow(path.shift(Offset(0,-1)), Colors.grey[200].withAlpha(50), 0, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
