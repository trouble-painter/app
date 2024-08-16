import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/canvas/game_painter.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';

class GameCanvas extends StatelessWidget {
  const GameCanvas({
    super.key,
    this.repaintBoundaryKey,
    required this.size,
    required this.brushSize,
    required this.drawingList,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerUp,
  });

  final Size size;
  final double brushSize;
  final GlobalKey? repaintBoundaryKey;
  final List<GameDrawing> drawingList;
  final void Function(Offset offset, Size canvasSize)? onPointerDown;
  final void Function(Offset offset, Size canvasSize)? onPointerMove;
  final void Function(Offset offset, Size canvasSize)? onPointerUp;

  Offset getTruncatedOffset(BuildContext context, Offset position) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(position);
    return Offset(
      offset.dx.truncate().toDouble(),
      offset.dy.truncate().toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        final offset = getTruncatedOffset(context, event.position);
        onPointerDown?.call(offset, size);
      },
      onPointerMove: (event) {
        final offset = getTruncatedOffset(context, event.position);
        onPointerMove?.call(offset, size);
      },
      onPointerUp: (event) {
        final offset = getTruncatedOffset(context, event.position);
        onPointerUp?.call(offset, size);
      },
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: RepaintBoundary(
          key: repaintBoundaryKey,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.color.text.withOpacity(0.1),
              ),
              child: CustomPaint(
                painter: GamePainter(
                  brushSize: brushSize,
                  drawingList: drawingList,
                  brushOverlayColor: context.color.text,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
