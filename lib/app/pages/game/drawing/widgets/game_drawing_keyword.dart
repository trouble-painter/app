import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/clipper/bubble_clipper.dart';
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
      clipper: const BubbleClipper(
        arrowHeight: 10,
        arrowWidth: 15,
      ),
      child: Container(
        color: context.color.text,
        height: 53,
        constraints: const BoxConstraints(
          minWidth: 157,
          maxWidth: 300,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 4,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            isMafia ? category : keyword,
            style: context.typo.header3.copyWith(
              color: isMafia ? context.color.primary : Palette.darkBlack,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
