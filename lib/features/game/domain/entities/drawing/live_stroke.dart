import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';

/// The stroke being drawn, simplified as the points come in.
///
/// A kept point never changes, so only the points after the last sent kept point
/// have to be sent again. The last point is not kept yet: it follows the pen.
class LiveStroke {
  /// [startMs] is the time since the turn started
  LiveStroke({
    required Offset start,
    required double startMs,
    required this.epsilon,
    required this.maxPoints,
  })  : _kept = [start],
        _keptMs = [startMs];

  /// A point within this distance of the line through its neighbours is dropped
  final double epsilon;

  /// The stroke never grows past this many points
  final int maxPoints;

  final List<Offset> _kept;
  final List<double> _keptMs;

  /// The points since the last kept one. The last of them is the pen.
  final List<Offset> _pending = [];
  double _penMs = 0;

  /// Points that will not change
  int get keptLength => _kept.length;

  int get length => _kept.length + (_pending.isEmpty ? 0 : 1);

  /// Adds the pen at [point]. Returns false when nothing changed:
  /// the pen did not move, or the stroke is full.
  bool add(Offset point, double ms) {
    final pen = _pending.isEmpty ? _kept.last : _pending.last;
    if (point == pen) return false;

    /// The line from the last kept point to [point] must pass near every point since.
    final keepsPen = _pending.any(
      (p) => _distanceToSegment(p, _kept.last, point) > epsilon,
    );
    final nextLength = _kept.length + (keepsPen ? 2 : 1);
    if (nextLength > maxPoints) return false;

    if (keepsPen) {
      _kept.add(_pending.last);
      _keptMs.add(_penMs);
      _pending.clear();
    }
    _pending.add(point);
    _penMs = ms;
    return true;
  }

  /// Keeps the pen as the last point
  void finish() {
    if (_pending.isEmpty) return;
    _kept.add(_pending.last);
    _keptMs.add(_penMs);
    _pending.clear();
  }

  /// `t` is the time since the turn started for the first point,
  /// then the time since the previous point.
  Stroke get stroke {
    final points = [..._kept, if (_pending.isNotEmpty) _pending.last];
    final times = [..._keptMs, if (_pending.isNotEmpty) _penMs];
    return Stroke(
      x: [for (final p in points) p.dx],
      y: [for (final p in points) p.dy],
      t: [
        for (int i = 0; i < times.length; i++)
          i == 0 ? times[0] : times[i] - times[i - 1],
      ],
    );
  }

  static double _distanceToSegment(Offset point, Offset start, Offset end) {
    final segment = end - start;
    final lengthSquared = segment.distanceSquared;
    if (lengthSquared == 0) return (point - start).distance;
    final along =
        ((point - start).dx * segment.dx + (point - start).dy * segment.dy) /
            lengthSquared;
    return (point - (start + segment * min(max(along, 0), 1))).distance;
  }
}
