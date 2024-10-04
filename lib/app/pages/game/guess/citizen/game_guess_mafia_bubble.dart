import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class GameGuessMafiaBubble extends StatelessWidget {
  const GameGuessMafiaBubble({
    super.key,
    required this.mafiaAnswer,
  });

  final String mafiaAnswer;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const GameDrawingMafiaBubbleClipper(
        arrowHeight: 10,
        arrowWidth: 15,
      ),
      child: Container(
        color: context.color.text,
        constraints: BoxConstraints(
          maxWidth: context.screen.width - 90,
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 12,
          bottom: 22,
        ),
        child: AutoSizeText.rich(
          TextSpan(
            style: context.typo.header2.copyWith(
              color: mafiaAnswer.isEmpty
                  ? context.color.subtext1
                  : context.color.surface,
            ),
            children: mafiaAnswer.isEmpty
                ? [
                    TextSpan(text: S.current.gameGuessThinking),
                  ]
                : [
                    TextSpan(text: S.current.gameGuessAnswer),
                    TextSpan(
                      text: mafiaAnswer,
                    ),
                    TextSpan(text: S.current.gameGuessAnswer2),
                  ],
          ),
          maxLines: 2,
          minFontSize: 12,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class GameDrawingMafiaBubbleClipper extends CustomClipper<Path> {
  const GameDrawingMafiaBubbleClipper({
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
