import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';

class GameGuessCanvas extends StatelessWidget {
  const GameGuessCanvas({
    super.key,
    required this.isMafia,
    required this.category,
    required this.keyword,
    required this.sketchList,
  });
  final bool isMafia;
  final String category;
  final String keyword;
  final List<Sketch> sketchList;

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
