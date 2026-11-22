import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/utils/ext/canvas_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';

/// A player whose strokes lie near a tapped point.
class SketchHit {
  const SketchHit({required this.userId, required this.distance});

  final int userId;

  /// Distance from the tap to this player's nearest stroke.
  final double distance;
}

/// How close a tap must be to a stroke to count as touching it.
const double sketchHitRadius = 16;

/// The players with strokes within [radius] of [tap] on a canvas of [canvasSize].
///
/// Each player appears once, with the distance to their nearest stroke.
List<SketchHit> hitTestSketches(
  List<Sketch> sketchList, {
  required Offset tap,
  required Size canvasSize,
  double radius = sketchHitRadius,
}) {
  final nearestByUser = <int, double>{};
  for (final sketch in sketchList) {
    final distance = _distanceToSketch(sketch, tap, canvasSize);
    if (distance > radius) continue;
    final known = nearestByUser[sketch.userId];
    nearestByUser[sketch.userId] =
        known == null ? distance : min(known, distance);
  }
  return [
    for (final entry in nearestByUser.entries)
      SketchHit(userId: entry.key, distance: entry.value),
  ];
}

/// The id, among [userIds], of the player whose stroke is nearest [tap]; null when none is in reach.
int? nearestHitUserId(
  List<Sketch> sketchList, {
  required Iterable<int> userIds,
  required Offset tap,
  required Size canvasSize,
}) {
  final hits = hitTestSketches(sketchList, tap: tap, canvasSize: canvasSize)
      .where((hit) => userIds.contains(hit.userId));
  if (hits.isEmpty) return null;
  return hits.reduce((a, b) => a.distance <= b.distance ? a : b).userId;
}

double _distanceToSketch(Sketch sketch, Offset tap, Size canvasSize) {
  var nearest = double.infinity;
  for (final stroke in sketch.strokeList) {
    /// Segments never cross a clear point, like when painting.
    Offset? previous;
    for (int i = 0; i < stroke.length; i++) {
      final raw = Offset(stroke.x[i], stroke.y[i]);
      if (raw.isClearPoint) {
        previous = null;
        continue;
      }
      final point = Offset(
        raw.dx / sketch.canvasSize.width * canvasSize.width,
        raw.dy / sketch.canvasSize.height * canvasSize.height,
      );
      nearest = min(nearest, _distanceToSegment(tap, previous ?? point, point));
      previous = point;
    }
  }
  return nearest;
}

double _distanceToSegment(Offset p, Offset a, Offset b) {
  final ab = b - a;
  final lengthSquared = ab.dx * ab.dx + ab.dy * ab.dy;
  if (lengthSquared == 0) return (p - a).distance;
  final t = (((p - a).dx * ab.dx + (p - a).dy * ab.dy) / lengthSquared)
      .clamp(0.0, 1.0);
  return (p - (a + ab * t)).distance;
}
