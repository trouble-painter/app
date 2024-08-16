import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/canvas/game_painter.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

class GameCanvas extends StatelessWidget {
  const GameCanvas(
    this.sketchList, {
    super.key,
    this.repaintBoundaryKey,
    this.canvasColor,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerUp,
  });

  final double brushSize = 4;
  final Color? canvasColor;
  final GlobalKey? repaintBoundaryKey;
  final List<GameSketch> sketchList;
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
    const aspectRatio = 1 / 1.2;
    return Center(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final minSize = min(constraints.maxWidth, constraints.maxHeight);
            final isMinWidth = minSize == constraints.maxWidth;
            final size = Size(
              (isMinWidth ? minSize : minSize * aspectRatio).ceil().toDouble(),
              (isMinWidth ? minSize / aspectRatio : minSize).ceil().toDouble(),
            );
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
                width: isMinWidth ? size.width : null,
                height: isMinWidth ? null : size.height,
                child: RepaintBoundary(
                  key: repaintBoundaryKey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            canvasColor ?? context.color.text.withOpacity(0.05),
                      ),
                      child: CustomPaint(
                        painter: GamePainter(
                          brushSize: brushSize,
                          sketchList: sketchList,
                          brushOverlayColor: context.color.text,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
