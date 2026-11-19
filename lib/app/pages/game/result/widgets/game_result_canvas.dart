import 'dart:ui' show lerpDouble;

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_painter.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class GameResultCanvas extends StatelessWidget {
  const GameResultCanvas({
    super.key,
    required this.category,
    required this.keyword,
    required this.mafia,
    required this.sketchList,
  });

  final String category;
  final String keyword;
  final GameUser mafia;
  final List<Sketch> sketchList;

  BorderRadius get _borderRadius => const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Container(
          decoration: BoxDecoration(
            color: context.color.text,
            borderRadius: _borderRadius,
          ),

          /// Canvas
          child: GameCanvas(
            sketchList: sketchList,
            borderRadius: _borderRadius,
          ),
        ),

        /// Mafia strokes
        Positioned.fill(
          child: ClipRRect(
            borderRadius: _borderRadius,
            child: _MafiaPulse(
              sketchList: [
                for (final sketch in sketchList)
                  if (sketch.userId == mafia.id) sketch,
              ],
            ),
          ),
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
              const SizedBox(width: 8),

              /// Mafia
              Flexible(
                child: _Tag(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: mafia.playerColor.drawing,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          mafia.nickname,
                          style: context.typo.caption0.copyWith(
                            color: context.color.surface,
                            fontWeight: context.typo.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
        color: context.color.surface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

/// Redraws [sketchList] over the canvas, thickening and glowing in and out.
class _MafiaPulse extends StatefulWidget {
  const _MafiaPulse({required this.sketchList});

  final List<Sketch> sketchList;

  @override
  State<_MafiaPulse> createState() => _MafiaPulseState();
}

class _MafiaPulseState extends State<_MafiaPulse>
    with SingleTickerProviderStateMixin {
  static const Duration _period = Duration(milliseconds: 900);
  static const double _maxHaloSize = 20;
  static const double _maxHaloAlpha = 0.45;

  /// The strokes themselves thicken by this much at the peak.
  static const double _maxStrokeGrowth = 2;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _period,
  )..repeat(reverse: true);

  late final Animation<double> _pulse = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sketchList.isEmpty) return const SizedBox.shrink();
    return Stack(
      fit: StackFit.expand,
      children: [
        /// Halo
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _pulse,
            builder: (context, _) => CustomPaint(
              painter: GamePainter(
                brushSize: lerpDouble(
                  GameCanvas.brushSize,
                  _maxHaloSize,
                  _pulse.value,
                )!,
                sketchList: [
                  for (final sketch in widget.sketchList)
                    sketch.copyWith(
                      color: sketch.color.withValues(
                        alpha: _maxHaloAlpha * _pulse.value,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        /// The strokes stay sharp over their halo.
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _pulse,
            builder: (context, _) => CustomPaint(
              painter: GamePainter(
                brushSize:
                    GameCanvas.brushSize + _maxStrokeGrowth * _pulse.value,
                sketchList: widget.sketchList,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
