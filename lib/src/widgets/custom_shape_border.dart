// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   final double height;
//   final double peakPoint;

//   CustomShapeBorder({this.height, this.peakPoint});

//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     Path path = Path();

//     path.lineTo(0, rect.height + height);

//     path.quadraticBezierTo(rect.width / 2, rect.height + peakPoint, rect.width,
//         rect.height + height);
//     path.lineTo(rect.width, 0.0);
//     path.close();

//     return path;
//   }
// }
