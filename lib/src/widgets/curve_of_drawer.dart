import 'package:flutter/cupertino.dart';

class RectCirculerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0.0);
    path.lineTo(160, 0);
    path.quadraticBezierTo(size.width-20 , size.height / 2, 160, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RectCirculerClipper oldClipper) => false;
}
