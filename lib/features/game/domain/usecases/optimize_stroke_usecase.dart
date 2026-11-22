import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';

class OptimizeStrokeUsecaseParam {
  final double epsilion;
  final Stroke stroke;

  OptimizeStrokeUsecaseParam({
    required this.epsilion,
    required this.stroke,
  });
}

class OptimizeStrokeUsecase
    implements BaseUsecase<OptimizeStrokeUsecaseParam, Stroke> {
  static final $ = Provider.autoDispose<OptimizeStrokeUsecase>((ref) {
    return OptimizeStrokeUsecase();
  });

  @override
  Stroke call(
    OptimizeStrokeUsecaseParam param,
  ) {
    final (epsilon, points) = (param.epsilion, param.stroke);
    return ramerDouglasPeucker(points, epsilon);
  }

  Stroke ramerDouglasPeucker(
    Stroke stroke,
    double epsilon,
  ) {
    if (stroke.length < 3) {
      return stroke;
    }

    double getPerpendicularDistance(
      Offset point,
      Offset lineStart,
      Offset lineEnd,
    ) {
      double dx = lineEnd.dx - lineStart.dx;
      double dy = lineEnd.dy - lineStart.dy;
      double mag = dx * dx + dy * dy;
      if (mag == 0.0) {
        return (point - lineStart).distance;
      }
      double u =
          ((point.dx - lineStart.dx) * dx + (point.dy - lineStart.dy) * dy) /
              mag;
      u = u.clamp(0, 1);
      Offset intersection = Offset(
        lineStart.dx + u * dx,
        lineStart.dy + u * dy,
      );
      return (point - intersection).distance;
    }

    double maxDistance = 0.0;
    int index = 0;

    for (int i = 1; i < stroke.length - 1; i++) {
      double distance = getPerpendicularDistance(
        Offset(stroke.x[i], stroke.y[i]),
        Offset(stroke.x[0], stroke.y[0]),
        Offset(stroke.x.last, stroke.y.last),
      );
      if (distance > maxDistance) {
        maxDistance = distance;
        index = i;
      }
    }

    if (maxDistance > epsilon) {
      Stroke leftSegment = ramerDouglasPeucker(
        stroke.sublist(0, index + 1),
        epsilon,
      );
      Stroke rightSegment = ramerDouglasPeucker(
        stroke.sublist(index, stroke.length),
        epsilon,
      );

      /// The corner is reached after everything the left side took, not only
      /// after its own last interval.
      final rightFromCorner = rightSegment.copyWith(
        t: [leftSegment.t.last, ...rightSegment.t.sublist(1)],
      );
      return leftSegment
          .sublist(0, leftSegment.length - 1)
          .add(rightFromCorner);
    } else {
      return stroke.copyWith(
        x: [stroke.x.first, stroke.x.last],
        y: [stroke.y.first, stroke.y.last],

        /// `t` is the time since the previous point, so the dropped points'
        /// time goes to the last one; otherwise the stroke replays too fast.
        t: [stroke.t.first, stroke.t.skip(1).fold(0.0, (a, b) => a + b)],
      );
    }
  }
}
