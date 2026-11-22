import 'package:flutter/foundation.dart' show listEquals;
import 'package:material_ui/material_ui.dart' hide Image;
import 'package:trouble_painter/core/utils/ext/canvas_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';

class GamePainter extends CustomPainter {
  final List<Sketch> sketchList;
  final double brushSize;

  GamePainter({
    required this.brushSize,
    required this.sketchList,
    Color? brushOverlayColor,
    bool? isShowBurshOverlay,
  })  : isShowBurshOverlay = isShowBurshOverlay ?? false,
        sketchPaint = Paint(),
        brushOverlayPaint = Paint()
          ..color = brushOverlayColor ?? Colors.grey
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

  final Paint sketchPaint;
  final Paint brushOverlayPaint;
  final bool isShowBurshOverlay;

  @override
  void paint(Canvas canvas, Size size) {
    /// Drawing skech
    if (sketchList.isEmpty) return;
    canvas.saveLayer(Rect.largest, sketchPaint);
    drawing(
      canvas,
      size,
      sketchList: sketchList,
      paint: sketchPaint,
    );
    canvas.restore();
  }

  void drawing(
    Canvas canvas,
    Size size, {
    required Paint paint,
    required List<Sketch> sketchList,
    bool Function()? onPointDraw,
  }) {
    for (final sketch in sketchList) {
      /// Stroke
      for (final stroke in sketch.strokeList) {
        if (stroke.isEmpty) continue;

        final points = strokePoints(sketch, stroke, size);

        if (points.isEmpty) continue;
        paint
          ..color = sketch.color
          ..blendMode = BlendMode.srcOver
          ..strokeWidth = brushSize
          ..strokeCap = StrokeCap.round;

        if (points.length <= 2) {
          /// Draw point
          if (onPointDraw != null) {
            if (!onPointDraw()) return;
          }
          paint.style = PaintingStyle.fill;
          canvas.drawCircle(
            points.first,
            brushSize / 2,
            paint,
          );
        } else {
          /// Draw line
          paint.style = PaintingStyle.stroke;
          if (onPointDraw != null) {
            for (int i = 1; i < points.length - 1; ++i) {
              if (!onPointDraw()) return;
            }
          }
          canvas.drawPath(smoothPath(points), paint);
        }
      }
    }
  }

  /// The points of [stroke] scaled to [size], cut at each clear point.
  static List<Offset> strokePoints(Sketch sketch, Stroke stroke, Size size) {
    final List<Offset> points = [];
    for (int i = 0; i < stroke.length; i++) {
      final (x, y) = (stroke.x[i], stroke.y[i]);
      if (Offset(x, y).isClearPoint) {
        /// Clear
        points.clear();
      } else {
        /// Add
        points.add(
          Offset(
            x / sketch.canvasSize.width * size.width,
            y / sketch.canvasSize.height * size.height,
          ),
        );
      }
    }
    return points;
  }

  /// The curve through [points], which must be more than two.
  static Path smoothPath(List<Offset> points) {
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length - 1; ++i) {
      final p0 = points[i];
      final p1 = points[i + 1];
      path.quadraticBezierTo(
        p0.dx,
        p0.dy,
        (p0.dx + p1.dx) / 2,
        (p0.dy + p1.dy) / 2,
      );
    }
    return path;
  }

  @override

  /// A changed sketch is always a new [Sketch], even when a point moved without adding one.
  bool shouldRepaint(covariant GamePainter old) {
    return old.brushSize != brushSize ||
        !listEquals(old.sketchList, sketchList);
  }
}
