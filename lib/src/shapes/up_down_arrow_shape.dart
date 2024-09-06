import 'package:flutter/material.dart';

class UpDownArrowShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50.0;
    Path path = Path();
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(120 - radius, 0);
    path.quadraticBezierTo(120, 0, 120, radius);
    path.lineTo(120, 100 - radius);
    path.quadraticBezierTo(120, 100, 120 + radius, 100);
    path.lineTo(size.width - radius, 100);
    path.quadraticBezierTo(size.width, 100, size.width, 100 + radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);
    path.lineTo(size.width - 120 + radius, size.height);
    path.quadraticBezierTo(
        size.width - 120, size.height, size.width - 120, size.height - radius);
    path.lineTo(size.width - 120, size.height - 100 + radius);
    path.quadraticBezierTo(size.width - 120, size.height - 100,
        size.width - 120 - radius, size.height - 100);
    path.lineTo(radius, size.height - 100);
    path.quadraticBezierTo(0, size.height - 100, 0, size.height - 100 - radius);
    path.lineTo(0, radius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
