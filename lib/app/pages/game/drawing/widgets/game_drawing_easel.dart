import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class GameDrawingEasel extends StatelessWidget {
  const GameDrawingEasel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Bar
        Container(
          width: double.infinity,
          height: 18,
          decoration: BoxDecoration(
            color: Palette.easelBar,
            borderRadius: BorderRadius.circular(1.42),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              /// Leg
              LayoutBuilder(
                builder: (context, constraints) => CustomPaint(
                  painter: EaselLegPainter(),
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.color.surface.withOpacity(0),
                      context.color.surface.withOpacity(0.77),
                      context.color.surface,
                    ],
                    stops: const [0, 0.41, 0.63],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EaselLegPainter extends CustomPainter {
  EaselLegPainter()
      : legPainter = Paint()
          ..color = Palette.easelLeg
          ..style = PaintingStyle.fill;

  final Paint legPainter;
  final double legWidth = 25;
  final double radian = 77 * pi / 180;
  final double horizontalPaddingRatio = 0.12;

  @override
  void paint(Canvas canvas, Size size) {
    final (w, h) = (size.width, size.height);
    final leftLeg = Path()
      ..moveTo(w.ratio(horizontalPaddingRatio), h)
      ..relativeLineTo(legWidth, 0)
      ..relativeLineTo(h / tan(radian), -h)
      ..relativeLineTo(-legWidth, 0)
      ..close();
    canvas.drawPath(leftLeg, legPainter);

    final rightLeg = Path()
      ..moveTo(w - w.ratio(horizontalPaddingRatio), h)
      ..relativeLineTo(-legWidth, 0)
      ..relativeLineTo(-h / tan(radian), -h)
      ..relativeLineTo(legWidth, 0)
      ..close();
    canvas.drawPath(rightLeg, legPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
