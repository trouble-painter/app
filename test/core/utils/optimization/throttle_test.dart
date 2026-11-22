import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/utils/optimization/throttle.dart';

/// `testWidgets` runs in fake time, so `tester.pump` moves the throttle's timers.
void main() {
  testWidgets('runs at once, then drops calls within the window',
      (tester) async {
    final throttle = Throttle();
    final runs = <int>[];
    throttle.run(30, () => runs.add(1));
    throttle.run(30, () => runs.add(2));
    expect(runs, [1]);
    await tester.pump(const Duration(milliseconds: 30));
    expect(runs, [1]);
    throttle.run(30, () => runs.add(3));
    expect(runs, [1, 3]);
    throttle.cancel();
  });

  testWidgets('with trailing, runs the latest call when the window ends',
      (tester) async {
    final throttle = Throttle();
    final runs = <int>[];
    throttle.run(50, () => runs.add(1), trailing: true);
    throttle.run(50, () => runs.add(2), trailing: true);
    throttle.run(50, () => runs.add(3), trailing: true);
    expect(runs, [1]);
    await tester.pump(const Duration(milliseconds: 50));
    expect(runs, [1, 3]);
    throttle.cancel();
  });

  testWidgets('flush runs the waiting call now; cancel drops it',
      (tester) async {
    final throttle = Throttle();
    final runs = <int>[];
    throttle.run(50, () => runs.add(1), trailing: true);
    throttle.run(50, () => runs.add(2), trailing: true);
    throttle.flush();
    expect(runs, [1, 2]);
    throttle.run(50, () => runs.add(3), trailing: true);
    throttle.run(50, () => runs.add(4), trailing: true);
    throttle.cancel();
    await tester.pump(const Duration(milliseconds: 100));
    expect(runs, [1, 2, 3]);
  });
}
