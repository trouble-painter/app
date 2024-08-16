import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class GameWaitingTooltip extends StatelessWidget {
  const GameWaitingTooltip({
    super.key,
    required this.text,
  });

  final String text;
  final clipper = const GameWaitingTooltipClipper(
    arrowHeight: 5,
    arrowWidth: 14,
  );

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClipperShadowPainter(
        clipper: clipper,
        shadow: Shadow(
          blurRadius: 14.96,
          color: Palette.gray55.withOpacity(0.35),
          offset: const Offset(
            1.36,
            1.36,
          ),
        ),
      ),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          decoration: BoxDecoration(
            color: context.color.onHintContainer,
          ),
          constraints: BoxConstraints(
            maxWidth: context.screen.width - 32,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 8,
            bottom: 13,
          ),
          child: AutoSizeText(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.typo.caption1.copyWith(
              color: context.color.text,
            ),
          ),
        ),
      ),
    );
  }
}

class GameWaitingTooltipClipper extends CustomClipper<Path> {
  const GameWaitingTooltipClipper({
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

class ClipperShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  const ClipperShadowPainter({
    required this.shadow,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = shadow.toPaint();
    final clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
