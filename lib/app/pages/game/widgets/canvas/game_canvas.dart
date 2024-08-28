import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_painter.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameCanvas extends StatelessWidget {
  const GameCanvas({
    super.key,
    this.isDrawable = false,
    this.canvasColor,
    this.repaintBoundaryKey,
    required this.sketchList,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerUp,
    this.borderRadius,
  });

  final bool isDrawable;
  final double brushSize = 4;
  final Color? canvasColor;
  final GlobalKey? repaintBoundaryKey;
  final List<Sketch> sketchList;
  final BorderRadius? borderRadius;
  final void Function(Offset offset, Size canvasSize)? onPointerDown;
  final void Function(Offset offset, Size canvasSize)? onPointerMove;
  final void Function(Offset offset, Size canvasSize)? onPointerUp;

  Offset getTruncatedOffset(
    BuildContext context,
    Offset position,
    Size size,
  ) {
    try {
      final box = context.findRenderObject() as RenderBox;
      final offset = box.globalToLocal(position);
      return Offset(
        (offset.dx.truncate().toDouble()).clamp(0, size.width),
        (offset.dy.truncate().toDouble()).clamp(0, size.height),
      );
    } catch (e) {
      return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.canvasRatio,
      child: IgnorePointer(
        ignoring: !isDrawable,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(constraints.maxWidth, constraints.maxHeight);
              return Listener(
                onPointerDown: (event) {
                  final offset =
                      getTruncatedOffset(context, event.position, size);
                  onPointerDown?.call(offset, size);
                },
                onPointerMove: (event) {
                  final offset =
                      getTruncatedOffset(context, event.position, size);
                  onPointerMove?.call(offset, size);
                },
                onPointerUp: (event) {
                  final offset =
                      getTruncatedOffset(context, event.position, size);
                  onPointerUp?.call(offset, size);
                },
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: RepaintBoundary(
                    key: repaintBoundaryKey,
                    child: ClipRRect(
                      borderRadius: borderRadius ??
                          const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: canvasColor ?? context.color.text,
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
      ),
    );
  }
}
