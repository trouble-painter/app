import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint_result.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameGuessCanvas extends StatelessWidget {
  const GameGuessCanvas({
    super.key,
    required this.isMafia,
    required this.category,
    required this.keyword,
    required this.sketchList,
    required this.aiHintNotifier,
    required this.repaintBoundaryKey,
  });
  final bool isMafia;
  final String category;
  final GlobalKey repaintBoundaryKey;
  final String keyword;
  final List<Sketch> sketchList;
  final ValueNotifier<AiHint> aiHintNotifier;

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 16;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        /// Canvas
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: context.color.text,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: GameCanvas(
            sketchList: sketchList,
            repaintBoundaryKey: repaintBoundaryKey,
          ),
        ),

        /// AiHint
        if (isMafia)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ValueListenableBuilder(
              valueListenable: aiHintNotifier,
              builder: (context, aiHint, child) {
                return AiHintResult(
                  aiHint: aiHint,
                  borderRadius: borderRadius,
                );
              },
            ),
          ),

        /// Category & Keyword
        if (!isMafia)
          Positioned(
            top: -16,
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
                    style: context.typo.caption0.copyWith(
                      color: context.color.primary,
                    ),
                  ),
                  if (!isMafia) ...[
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
                      style: context.typo.caption0.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
