import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/sketch_pulse.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class GameResultCanvas extends StatelessWidget {
  const GameResultCanvas({
    super.key,
    required this.category,
    required this.keyword,
    required this.mafia,
    required this.selectedUserId,
    required this.sketchList,
  });

  final String category;
  final String keyword;
  final GameUser mafia;

  /// Whose strokes pulse; null when nobody's do
  final int? selectedUserId;

  final List<Sketch> sketchList;

  BorderRadius get _borderRadius => const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Full width like the drawing page, with the picked strokes drawn over it.
        Stack(
          children: [
            /// Canvas
            GameCanvas(
              sketchList: sketchList,
              borderRadius: _borderRadius,
            ),

            /// Picked player's strokes
            Positioned.fill(
              child: ClipRRect(
                borderRadius: _borderRadius,
                child: SketchPulse(
                  sketchList: [
                    for (final sketch in sketchList)
                      if (sketch.userId == selectedUserId) sketch,
                  ],
                ),
              ),
            ),
          ],
        ),

        /// Labels, not buttons: only "play again" below is pressable.
        Positioned(
          top: 14,
          left: 14,
          right: 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Keyword
              Flexible(
                /// The canvas is the text color, so text on it takes the surface color.
                child: _Tag(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: keyword,
                          style: context.typo.header2.copyWith(
                            color: context.color.surface,
                          ),
                        ),
                        TextSpan(
                          text: ' ($category)',
                          style: context.typo.body2.copyWith(
                            color: context.color.surface,
                            fontWeight: context.typo.bold,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
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

/// A faint box for the labels on the canvas
class _Tag extends StatelessWidget {
  const _Tag({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: context.color.text.withValues(alpha: 1.0),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
