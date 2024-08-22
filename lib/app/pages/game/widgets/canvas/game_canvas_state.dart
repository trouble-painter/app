import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameCanvasState {
  final int maxStroke;
  final List<Sketch> sketchList;
  final Sketch sketch;
  final DateTime sketchStartedAt;
  final DateTime lastPointedAt;
  final int nStroke;
  final void Function()? onDone;

  GameCanvasState({
    required this.maxStroke,
    required this.sketchList,
    required this.sketch,
    required this.sketchStartedAt,
    required this.lastPointedAt,
    required this.nStroke,
    required this.onDone,
  });

  bool get canSketch => nStroke < maxStroke;

  GameCanvasState copyWith({
    int? maxStroke,
    List<Sketch>? sketchList,
    Sketch? sketch,
    DateTime? sketchStartedAt,
    DateTime? lastPointedAt,
    int? nStroke,
    void Function()? onDone,
  }) {
    return GameCanvasState(
      maxStroke: maxStroke ?? this.maxStroke,
      sketchList: sketchList ?? this.sketchList,
      sketch: sketch ?? this.sketch,
      sketchStartedAt: sketchStartedAt ?? this.sketchStartedAt,
      lastPointedAt: lastPointedAt ?? this.lastPointedAt,
      nStroke: nStroke ?? this.nStroke,
      onDone: onDone ?? this.onDone,
    );
  }

  @override
  String toString() {
    return 'GameCanvasState(maxStorke: $maxStroke, sketchList: $sketchList, sketch: $sketch, sketchStartedAt: $sketchStartedAt, lastPointedAt: $lastPointedAt, onDone: $onDone)';
  }
}
