import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class GameDrawingKeyword extends StatelessWidget {
  const GameDrawingKeyword({
    super.key,
    required this.isMafia,
    required this.category,
    required this.keyword,
  });

  final bool isMafia;
  final String category;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const GameDrawingKeywordClipper(
        arrowHeight: 10,
        arrowWidth: 15,
      ),
      child: Container(
        color: context.color.text,
        height: 62,
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        padding: const EdgeInsets.only(
          left: 13,
          right: 13,
          top: 4,
          bottom: 14,
        ),
        child: AutoSizeText(
          isMafia ? category : "$category & $keyword",
          style: context.typo.header3.copyWith(
            color: isMafia ? context.color.primary : Palette.darkBlack,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class GameDrawingKeywordClipper extends CustomClipper<Path> {
  const GameDrawingKeywordClipper({
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
      ..arcTo(
        Rect.fromCircle(
          center: Offset(w - r, (h - arrowHeight) / 2),
          radius: r,
        ),
        -90 * pi / 180,
        150 * pi / 180,
        false,
      )
      ..relativeLineTo(0, 10)
      ..relativeArcToPoint(
        const Offset(-1, 0.8),
        radius: const Radius.circular(1.5),
      )
      ..lineTo(w - r, h - arrowHeight)
      ..lineTo(r, h - arrowHeight)
      ..arcToPoint(Offset(0, r), radius: Radius.circular(r))
      ..arcToPoint(Offset(r, 0), radius: Radius.circular(r))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
