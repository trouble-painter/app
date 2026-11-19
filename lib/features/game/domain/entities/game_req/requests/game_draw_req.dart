part of '../game_req.dart';

/// One stroke. [index] is the last stroke (replace) or the next one (append).
class GameDrawReq extends GameReq {
  final int index;
  final Stroke stroke;
  final Size canvas;

  const GameDrawReq({
    required this.index,
    required this.stroke,
    required this.canvas,
  });
}
