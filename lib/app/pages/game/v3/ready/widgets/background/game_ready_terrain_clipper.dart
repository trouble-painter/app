import 'package:flutter/material.dart';

class GameReadyTerrainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 5.45)
      ..lineTo(size.width * 0.21, 2.97)
      ..lineTo(size.width * 0.51, 2.97)
      ..lineTo(size.width * 0.62, 0)
      ..lineTo(size.width, 5.45)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
