part of '../game_req.dart';

/// The points of stroke [index] from [from] on.
/// [index] is the last stroke, or the next one with [from] 0.
class GameDrawReq extends GameReq {
  final int index;
  final int from;
  final Stroke stroke;

  /// Sent with the first piece of a stroke only
  final Size? canvas;

  const GameDrawReq({
    required this.index,
    required this.from,
    required this.stroke,
    required this.canvas,
  });
}
