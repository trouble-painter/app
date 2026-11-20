import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameDrawingTurnBubble extends StatelessWidget {
  const GameDrawingTurnBubble({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.arrowX,
    this.maxLines,
    this.maxRadius = double.infinity,
  });

  final String text;
  final Color color;
  final Color textColor;

  /// Distance of the arrow's center from the left edge; the center when null
  final double? arrowX;

  /// Longer text is cut with an ellipsis; unlimited when null
  final int? maxLines;

  /// Corners are round up to this; the ends are half circles when it is large
  final double maxRadius;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GameDrawingTurnBubbleClipper(
        arrowHeight: 6,
        arrowWidth: 14,
        arrowX: arrowX,
        maxRadius: maxRadius,
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
          maxLines: maxLines,
          overflow: maxLines == null ? null : TextOverflow.ellipsis,
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
    this.arrowX,
    this.maxRadius = double.infinity,
  });

  final double arrowHeight;
  final double arrowWidth;
  final double? arrowX;
  final double maxRadius;

  @override
  Path getClip(Size size) {
    final (w, h) = (size.width, size.height);
    final bodyH = h - arrowHeight;
    final r = min((bodyH) / 2, maxRadius);
    final cx =
        (arrowX ?? w / 2).clamp(r + arrowWidth / 2, w - r - arrowWidth / 2);
    Path path = Path()
      ..moveTo(r, 0)
      ..lineTo(w - r, 0)
      ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
      ..lineTo(w, bodyH - r)
      ..arcToPoint(Offset(w - r, bodyH), radius: Radius.circular(r))
      ..lineTo(cx + arrowWidth / 2, bodyH)
      ..lineTo(cx, h)
      ..lineTo(cx - arrowWidth / 2, bodyH)
      ..lineTo(r, bodyH)
      ..arcToPoint(Offset(0, bodyH - r), radius: Radius.circular(r))
      ..lineTo(0, r)
      ..arcToPoint(Offset(r, 0), radius: Radius.circular(r))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(GameDrawingTurnBubbleClipper oldClipper) =>
      oldClipper.arrowX != arrowX || oldClipper.maxRadius != maxRadius;
}
