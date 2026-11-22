import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/sketch_playback.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';

/// Points every [stepMs] along x, the first at [startMs] since the turn started
Stroke line(int points, {double startMs = 0, double stepMs = 10}) => Stroke(
      x: [for (int i = 0; i < points; i++) i * 10.0],
      y: List.filled(points, 0),
      t: [startMs, for (int i = 1; i < points; i++) stepMs],
    );

Sketch sketchOf(List<Stroke> strokes) => Sketch(
      userId: 1,
      strokeList: strokes,
      canvasSize: const Size(100, 100),
      color: Colors.black,
    );

void main() {
  const buffer = 90.0;

  test('shows a sketch drawn before it was watched at once', () {
    final sketch = sketchOf([line(5)]);
    final playback = SketchPlayback(bufferMs: buffer)..skip(sketch);
    expect(playback.isDone(sketch), isTrue);
    expect(
      playback.advance(sketch, 0).strokeList.single.x,
      sketch.strokeList.single.x,
    );
  });

  test('keeps the pen moving every frame while pieces come late and bunched',
      () {
    final playback = SketchPlayback(bufferMs: buffer)..skip(sketchOf([]));

    /// The pen moves 10 px every 10 ms from 1000 ms. A piece is sent every 30 ms,
    /// and every fifth piece is 60 ms late, so it comes with the next one.
    const drawMs = 2000;
    double arrivedUntil(double now) {
      double until = 0;
      for (double sent = 1000; sent <= now; sent += 30) {
        final isLate = ((sent - 1000) ~/ 30) % 5 == 4;
        if (sent + (isLate ? 60 : 0) <= now) until = sent;
      }
      return until;
    }

    double? lastX;
    for (double now = 1000; now < 1000 + drawMs; now += 16) {
      final until = arrivedUntil(now);
      if (until == 0) continue;
      final points = ((until - 1000) ~/ 10) + 1;
      final shown =
          playback.advance(sketchOf([line(points, startMs: 1000)]), 16);
      final x = shown.strokeList.isEmpty ? 0.0 : shown.strokeList.last.x.last;
      if (now > 1300) {
        expect(x, greaterThan(lastX!), reason: 'stalled at $now ms');

        /// The pen is drawn at most 250 ms behind the drawer's.
        expect((now - 1000) / 10 * 10 - x, lessThan(250));
      }
      lastX = x;
    }
  });

  test('hurries when it falls behind and never passes the latest point', () {
    final playback = SketchPlayback(bufferMs: buffer)..skip(sketchOf([]));
    final sketch = sketchOf([line(31, startMs: 1000)]);
    for (int i = 0; i < 100; i++) {
      playback.advance(sketch, 16);
    }
    expect(playback.isDone(sketch), isTrue);
    expect(playback.advance(sketch, 16).strokeList.single.x.last, 300);
  });

  test('skips the pause between strokes', () {
    final firstStroke = line(3, startMs: 1000);
    final playback = SketchPlayback(bufferMs: buffer)
      ..skip(sketchOf([firstStroke]));

    /// The next stroke starts 5 s later; it starts at once.
    final sketch = sketchOf([firstStroke, line(31, startMs: 6000)]);
    final shown = playback.advance(sketch, 0);
    expect(shown.strokeList, hasLength(2));
    expect(shown.strokeList.last.x, [0]);
  });

  test('jumps ahead when it is far behind', () {
    final playback = SketchPlayback(bufferMs: buffer)
      ..skip(sketchOf([line(2)]));
    final sketch = sketchOf([line(301)]);
    final shown = playback.advance(sketch, 0);
    expect(shown.strokeList.single.x.last, closeTo(2910, 1));
  });

  test('after a still pen the line moves on at once instead of crawling', () {
    final playback = SketchPlayback(bufferMs: buffer)
      ..skip(sketchOf([line(2, startMs: 1000)]));

    /// The pen stood still for 1 s at x 10, then moved to x 20.
    final sketch = sketchOf([
      Stroke(x: [0, 10, 20], y: [0, 0, 0], t: [1000, 10, 1000]),
    ]);
    expect(playback.advance(sketch, 0).strokeList.single.x.last, 10);
    final moving = playback.advance(sketch, 30).strokeList.single.x.last;
    expect(moving, greaterThan(10));
    expect(moving, lessThan(20));
  });

  test('an undone stroke is dropped from what is shown', () {
    final playback = SketchPlayback(bufferMs: buffer)
      ..skip(sketchOf([line(3), line(3, startMs: 1000)]));
    final shown = playback.advance(sketchOf([line(3)]), 16);
    expect(shown.strokeList, hasLength(1));
  });
}
