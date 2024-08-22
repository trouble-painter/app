import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameResultCanvas extends StatelessWidget {
  const GameResultCanvas({
    super.key,
    required this.category,
    required this.keyword,
    required this.sketchList,
  });

  final String category;
  final String keyword;
  final List<Sketch> sketchList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Background
        Container(
          decoration: BoxDecoration(
            color: context.color.text,
            borderRadius: BorderRadius.circular(24),
          ),

          /// Canvas
          child: GameCanvas(sketchList: sketchList),
        ),

        /// Keyword
        Positioned(
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: context.color.iconContainer,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: context.typo.subHeader2.copyWith(
                    color: context.color.primary,
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: context.color.primary,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                Text(
                  keyword,
                  style: context.typo.subHeader2.copyWith(
                    color: context.color.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
