import 'dart:math';

import 'package:flutter/material.dart';

class BubbleClipper extends CustomClipper<Path> {
  const BubbleClipper({
    required this.arrowHeight,
    required this.arrowWidth,
  });

  final double arrowHeight;
  final double arrowWidth;

  @override
  Path getClip(Size size) {
    final (w, h) = (size.width, size.height);
    double r = h / 2;
    Path path = Path()
      ..moveTo(r, 0)
      ..lineTo(w - r * 2, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(w - r, r),
          radius: r,
        ),
        -90 * pi / 180,
        120 * pi / 180,
        false,
      )
      ..arcToPoint(
        Offset(w - 1, h),
        radius: const Radius.elliptical(10, 10),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(w - 15, h - 4),
        radius: const Radius.elliptical(15, 10),
        clockwise: true,
      )
      ..arcTo(
        Rect.fromCircle(
          center: Offset(w - r, r),
          radius: r,
        ),
        -90 * pi / 180,
        180 * pi / 180,
        false,
      )
      ..lineTo(r, h)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(r, r),
          radius: r,
        ),
        90 * pi / 180,
        180 * pi / 180,
        false,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
