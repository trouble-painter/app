import 'package:flutter/material.dart' hide Image;
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

class GamePainter extends CustomPainter {
  final List<GameSketch> sketchList;
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
    required List<GameSketch> sketchList,
    bool Function()? onPointDraw,
  }) {
    for (final sketch in sketchList) {
      /// Stroke
      for (final stroke in sketch.strokeList) {
        if (stroke.isEmpty) continue;

        /// Point
        final List<Offset> points = [];
        for (int i = 0; i < stroke.length; i++) {
          final (x, y, _) = (stroke.x[i], stroke.y[i], stroke.t[i]);
          final point = Offset(
            x / sketch.canvasSize.width * size.width,
            y / sketch.canvasSize.height * size.height,
          );
          points.add(point);
        }

        if (points.isEmpty) continue;
        paint
          ..color = sketch.color
          ..blendMode = BlendMode.srcOver
          ..strokeWidth = brushSize
          ..strokeCap = StrokeCap.round;

        final path = Path()..moveTo(points.first.dx, points.first.dy);
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
          for (int i = 1; i < points.length - 1; ++i) {
            if (onPointDraw != null) {
              if (!onPointDraw()) return;
            }
            final p0 = points[i];
            final p1 = points[i + 1];
            path.quadraticBezierTo(
              p0.dx,
              p0.dy,
              (p0.dx + p1.dx) / 2,
              (p0.dy + p1.dy) / 2,
            );
            canvas.drawPath(path, paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant GamePainter oldDelegate) {
    return true;
  }
}
