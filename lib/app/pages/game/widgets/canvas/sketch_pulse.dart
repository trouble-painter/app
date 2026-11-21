import 'dart:ui' show lerpDouble;

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_painter.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';

/// Redraws [sketchList] over the canvas, thickening and glowing in and out.
class SketchPulse extends StatefulWidget {
  const SketchPulse({super.key, required this.sketchList});

  final List<Sketch> sketchList;

  @override
  State<SketchPulse> createState() => _SketchPulseState();
}

class _SketchPulseState extends State<SketchPulse>
    with SingleTickerProviderStateMixin {
  static const Duration _period = Duration(milliseconds: 555);
  static const double _fullHaloSize = 20;

  /// The halo pulses between 40% and 80% of the full size, never vanishing.
  static const double _minHaloSize = _fullHaloSize * 0.4;
  static const double _maxHaloSize = _fullHaloSize * 0.5;
  static const double _minHaloAlpha = 0.45;
  static const double _maxHaloAlpha = 0.65;

  /// The strokes always stay thicker than the original by at least the min.
  static const double _minStrokeGrowth = 1;
  static const double _maxStrokeGrowth = 3;

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
                  _minHaloSize,
                  _maxHaloSize,
                  _pulse.value,
                )!,
                sketchList: [
                  for (final sketch in widget.sketchList)
                    sketch.copyWith(
                      color: sketch.color.withValues(
                        alpha: lerpDouble(
                          _minHaloAlpha,
                          _maxHaloAlpha,
                          _pulse.value,
                        )!,
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
                brushSize: GameCanvas.brushSize +
                    lerpDouble(
                      _minStrokeGrowth,
                      _maxStrokeGrowth,
                      _pulse.value,
                    )!,
                sketchList: widget.sketchList,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
