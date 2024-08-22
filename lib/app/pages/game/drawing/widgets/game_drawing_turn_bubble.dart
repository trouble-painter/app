import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameDrawingTurnBubble extends StatelessWidget {
  const GameDrawingTurnBubble({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const GameDrawingTurnBubbleClipper(
        arrowHeight: 6,
        arrowWidth: 14,
      ),
      child: Container(
        color: color,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 6,
          bottom: 12,
        ),
        child: Text(
          text,
          style: context.typo.caption0.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class GameDrawingTurnBubbleClipper extends CustomClipper<Path> {
  const GameDrawingTurnBubbleClipper({
    required this.arrowHeight,
    required this.arrowWidth,
  });

  final double arrowHeight;
  final double arrowWidth;

  @override
  Path getClip(Size size) {
    final (w, h) = (size.width, size.height);
    double r = (h - arrowHeight) / 2;
    Path path = Path()
      ..moveTo(r, 0)
      ..lineTo(w - r, 0)
      ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
      ..arcToPoint(Offset(w - r, h - arrowHeight), radius: Radius.circular(r))
      ..lineTo((w + arrowWidth) / 2, h - arrowHeight)
      ..lineTo(w / 2, h)
      ..lineTo((w - arrowWidth) / 2, h - arrowHeight)
      ..lineTo(r, h - arrowHeight)
      ..arcToPoint(Offset(0, r), radius: Radius.circular(r))
      ..arcToPoint(Offset(r, 0), radius: Radius.circular(r))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
