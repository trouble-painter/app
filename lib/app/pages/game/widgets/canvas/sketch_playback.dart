import 'dart:math';
import 'dart:ui';

import 'package:trouble_painter/core/utils/ext/canvas_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';

/// Plays a sketch that arrives in pieces on the drawer's own timeline, a little
/// behind its latest point, so the pen keeps moving between pieces instead of
/// jumping with each one.
///
/// The speed follows the lag: it hurries when pieces pile up and slows down when
/// they run short, so the lag stays near [bufferMs]. Time in which nothing is
/// drawn, like the pause between strokes, is skipped.
class SketchPlayback {
  SketchPlayback({required this.bufferMs});

  /// A piece comes every `drawThrottleMs`; this many of them absorb a late one.
  factory SketchPlayback.forDrawThrottle(int drawThrottleMs) =>
      SketchPlayback(bufferMs: (drawThrottleMs * _bufferPieces).toDouble());
  static const int _bufferPieces = 3;

  /// How far behind the latest point the playback aims to be
  final double bufferMs;

  /// Further behind than this, the playback jumps instead of hurrying
  static const double maxLagMs = 1000;
  static const double minRate = 0.5;
  static const double maxRate = 2;

  /// How quickly the speed follows the lag
  static const double rateFollowMs = 150;

  /// A point after a long still pen is reached in at most this, so the line
  /// waits and then moves instead of crawling all the while.
  static const double maxSegmentMs = 120;

  /// Time since the turn started on the drawer's clock. Null before anything is drawn.
  double? _playhead;
  double _rate = 1;

  /// Shows [sketch] as it is, for a sketch that was not drawn in front of the viewer.
  void skip(Sketch sketch) {
    _playhead = _Timeline(sketch.strokeList).end;
    _rate = 1;
  }

  bool isDone(Sketch sketch) {
    final end = _Timeline(sketch.strokeList).end;
    final playhead = _playhead;
    return end == null || (playhead != null && playhead >= end);
  }

  /// Moves on by [elapsedMs] of wall time and returns the part of [sketch] drawn by then.
  Sketch advance(Sketch sketch, double elapsedMs) {
    final timeline = _Timeline(sketch.strokeList);
    final end = timeline.end;
    if (end == null) {
      _playhead = null;
      return sketch;
    }

    /// An undone stroke or a new turn moves the end back.
    var playhead = min(_playhead ?? double.negativeInfinity, end);

    /// Nothing changes until the next motion, so wait there only as long as the buffer needs.
    final motion = timeline.nextMotionFrom(playhead);
    if (motion > playhead) {
      playhead = max(playhead, min(motion, end - bufferMs));
    }

    if (end - playhead > maxLagMs) playhead = end - bufferMs;

    final targetRate = ((end - playhead) / bufferMs).clamp(minRate, maxRate);
    _rate += (targetRate - _rate) * (1 - exp(-elapsedMs / rateFollowMs));
    playhead = min(end, playhead + elapsedMs * _rate);
    _playhead = playhead;
    return sketch.copyWith(strokeList: timeline.cut(playhead));
  }
}

class _Timeline {
  _Timeline(this.strokes) : times = [for (final s in strokes) _timesOf(s)];

  final List<Stroke> strokes;

  /// Time since the turn started of every point
  final List<List<double>> times;

  /// `t` is the time since the turn started for the first point, then since the previous point.
  static List<double> _timesOf(Stroke stroke) {
    final List<double> times = [];
    double at = 0;
    for (final t in stroke.t) {
      at += t;
      times.add(at);
    }
    return times;
  }

  double? get end {
    for (int s = times.length - 1; s >= 0; s--) {
      if (times[s].isNotEmpty) return times[s].last;
    }
    return null;
  }

  /// When point [i] of stroke [s] starts to be drawn
  double _motionStart(int s, int i) {
    final at = times[s];
    if (i == 0) return at[0];
    return at[i] - min(at[i] - at[i - 1], SketchPlayback.maxSegmentMs);
  }

  /// [at] itself while something is being drawn, else when the next thing starts.
  double nextMotionFrom(double at) {
    for (int s = 0; s < times.length; s++) {
      for (int i = 0; i < times[s].length; i++) {
        if (times[s][i] <= at) continue;
        return max(at, _motionStart(s, i));
      }
    }
    return at;
  }

  /// The strokes as drawn by [at], the last point part of the way to the next one.
  List<Stroke> cut(double at) {
    final List<Stroke> cut = [];
    for (int s = 0; s < strokes.length; s++) {
      final stroke = strokes[s];
      final pointsAt = times[s];
      if (pointsAt.isEmpty || pointsAt.first > at) break;
      int drawn = 0;
      while (drawn < pointsAt.length && pointsAt[drawn] <= at) {
        drawn++;
      }
      if (drawn == pointsAt.length) {
        cut.add(stroke);
        continue;
      }
      var part = stroke.sublist(0, drawn);
      final from = Offset(stroke.x[drawn - 1], stroke.y[drawn - 1]);
      final to = Offset(stroke.x[drawn], stroke.y[drawn]);
      final start = _motionStart(s, drawn);
      if (at > start && !from.isClearPoint && !to.isClearPoint) {
        final point =
            Offset.lerp(from, to, (at - start) / (pointsAt[drawn] - start))!;
        part = part.add(
          Stroke(x: [point.dx], y: [point.dy], t: [at - pointsAt[drawn - 1]]),
        );
      }
      cut.add(part);
      break;
    }
    return cut;
  }
}
