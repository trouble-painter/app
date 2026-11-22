import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/usecases/optimize_stroke_usecase.dart';

double _sum(List<double> values) => values.fold(0.0, (a, b) => a + b);

void main() {
  final usecase = OptimizeStrokeUsecase();
  const epsilon = 2.0;

  Stroke optimize(Stroke stroke) => usecase(
        OptimizeStrokeUsecaseParam(epsilion: epsilon, stroke: stroke),
      );

  test('keeps the time of the points it drops on a straight line', () {
    final stroke = Stroke(
      x: [0, 10, 20, 30, 40],
      y: [0, 0, 0, 0, 0],
      t: [7000, 100, 100, 100, 100],
    );

    final result = optimize(stroke);

    expect(result.x, [0, 40]);
    expect(result.t, [7000, 400]);
  });

  test('keeps the time of the points it drops between the corners', () {
    // A right angle at (40, 0): both legs are straight and get reduced to their ends.
    final stroke = Stroke(
      x: [0, 10, 20, 30, 40, 40, 40, 40, 40],
      y: [0, 0, 0, 0, 0, 10, 20, 30, 40],
      t: [500, 10, 20, 30, 40, 50, 60, 70, 80],
    );

    final result = optimize(stroke);

    expect(result.x, [0, 40, 40]);
    expect(result.y, [0, 0, 40]);
    expect(result.t, [500, 100, 260]);
  });

  test('never changes how long the stroke took, however often it is optimized',
      () {
    // The app optimizes the whole stroke again each time a point is added.
    var stroke = Stroke(x: [0], y: [0], t: [900]);
    var total = 900.0;
    for (var i = 1; i <= 30; i++) {
      final dt = 10.0 + i;
      total += dt;
      stroke = optimize(
        Stroke(
          x: [...stroke.x, i * 5.0],
          y: [...stroke.y, (i % 7 == 0) ? 30.0 : 0.0],
          t: [...stroke.t, dt],
        ),
      );
      expect(_sum(stroke.t), total);
    }
    expect(stroke.length, lessThan(31));
  });

  test('leaves a stroke of fewer than three points alone', () {
    final stroke = Stroke(x: [0, 10], y: [0, 5], t: [300, 50]);

    expect(optimize(stroke), stroke);
  });
}
