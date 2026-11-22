import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart' show listEquals;
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
    return RepaintBoundary(
      child: CustomPaint(
        size: Size.infinite,
        painter: _PulsePainter(
          pulse: _pulse,
          sketchList: widget.sketchList,
        ),
      ),
    );
  }
}

/// Shapes of [sketchList] built once per canvas size; each frame only restyles and redraws them.
class _PulsePainter extends CustomPainter {
  _PulsePainter({required this.pulse, required this.sketchList})
      : super(repaint: pulse);

  final Animation<double> pulse;
  final List<Sketch> sketchList;

  final Paint _paint = Paint()..strokeCap = StrokeCap.round;

  Size? _shapesSize;
  List<_Shape> _shapes = const [];

  List<_Shape> _shapesFor(Size size) {
    if (_shapesSize == size) return _shapes;
    _shapesSize = size;
    return _shapes = [
      for (final sketch in sketchList)
        for (final stroke in sketch.strokeList)
          if (!stroke.isEmpty)
            if (GamePainter.strokePoints(sketch, stroke, size) case final points
                when points.isNotEmpty)
              _Shape(
                color: sketch.color,
                dot: points.length <= 2 ? points.first : null,
                path:
                    points.length <= 2 ? null : GamePainter.smoothPath(points),
              ),
    ];
  }

  void _draw(Canvas canvas, List<_Shape> shapes, double width, double? alpha) {
    for (final shape in shapes) {
      _paint
        ..color =
            alpha == null ? shape.color : shape.color.withValues(alpha: alpha)
        ..strokeWidth = width;
      final dot = shape.dot;
      if (dot != null) {
        _paint.style = PaintingStyle.fill;
        canvas.drawCircle(dot, width / 2, _paint);
      } else {
        _paint.style = PaintingStyle.stroke;
        canvas.drawPath(shape.path!, _paint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final shapes = _shapesFor(size);
    final t = pulse.value;

    /// Halo
    _draw(
      canvas,
      shapes,
      lerpDouble(
        _SketchPulseState._minHaloSize,
        _SketchPulseState._maxHaloSize,
        t,
      )!,
      lerpDouble(
        _SketchPulseState._minHaloAlpha,
        _SketchPulseState._maxHaloAlpha,
        t,
      )!,
    );

    /// The strokes stay sharp over their halo.
    _draw(
      canvas,
      shapes,
      GameCanvas.brushSize +
          lerpDouble(
            _SketchPulseState._minStrokeGrowth,
            _SketchPulseState._maxStrokeGrowth,
            t,
          )!,
      null,
    );
  }

  /// The pulse repaints through [repaint]; only a new sketch list needs a new painter.
  @override
  bool shouldRepaint(_PulsePainter old) =>
      !listEquals(old.sketchList, sketchList);
}

class _Shape {
  const _Shape({required this.color, this.dot, this.path});

  final Color color;

  /// Set for a stroke that is a lone point, else [path] is.
  final Offset? dot;
  final Path? path;
}
