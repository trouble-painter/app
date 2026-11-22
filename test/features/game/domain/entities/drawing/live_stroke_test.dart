import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/live_stroke.dart';

void main() {
  LiveStroke start({int maxPoints = 100}) => LiveStroke(
        start: Offset.zero,
        startMs: 1000,
        epsilon: 1,
        maxPoints: maxPoints,
      );

  test(
      'a straight line keeps only its ends, and the pen follows the last point',
      () {
    final stroke = start();
    for (int i = 1; i <= 4; i++) {
      expect(stroke.add(Offset(i * 10, 0), 1000.0 + i * 10), isTrue);
    }
    expect(stroke.keptLength, 1);
    expect(stroke.stroke.x, [0, 40]);

    /// The time of the dropped points goes to the pen.
    expect(stroke.stroke.t, [1000, 40]);
  });

  test('a corner is kept and never changes after', () {
    final stroke = start()
      ..add(const Offset(10, 0), 1010)
      ..add(const Offset(20, 0), 1020)
      ..add(const Offset(20, 10), 1030)
      ..add(const Offset(20, 20), 1040);
    expect(stroke.keptLength, 2);
    expect(stroke.stroke.x, [0, 20, 20]);
    expect(stroke.stroke.y, [0, 0, 20]);
    expect(stroke.stroke.t, [1000, 20, 20]);
  });

  test('a still pen adds nothing', () {
    final stroke = start()..add(const Offset(5, 5), 1010);
    expect(stroke.add(const Offset(5, 5), 1500), isFalse);
    expect(stroke.stroke.t, [1000, 10]);
  });

  test('finish keeps the pen', () {
    final stroke = start()..add(const Offset(10, 0), 1010);
    expect(stroke.keptLength, 1);
    stroke.finish();
    expect(stroke.keptLength, 2);
    expect(stroke.length, 2);
  });

  test('the stroke stops growing at maxPoints', () {
    final stroke = start(maxPoints: 2)..add(const Offset(10, 0), 1010);
    expect(stroke.add(const Offset(10, 10), 1020), isFalse);
    expect(stroke.stroke.x, [0, 10]);

    /// Moving the pen along the line does not add a point.
    expect(stroke.add(const Offset(20, 0), 1030), isTrue);
    expect(stroke.stroke.x, [0, 20]);
  });
}
