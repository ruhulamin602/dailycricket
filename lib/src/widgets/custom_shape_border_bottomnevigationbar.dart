// import 'package:flutter/cupertino.dart';

// class CustomShapeBorderBBNB extends ContinuousRectangleBorder {
//   final double height;
//   final double peakPoint;

//   CustomShapeBorderBBNB({this.height, this.peakPoint});

//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     Path path = Path();
//     path.moveTo(0, rect.height);
//     path.lineTo(0, height);

//     path.quadraticBezierTo(rect.width / 2, rect.height + peakPoint, rect.width,
//         height);
//     path.lineTo(rect.width, rect.height);
//     path.close();

//     return path;
//   }
// }
