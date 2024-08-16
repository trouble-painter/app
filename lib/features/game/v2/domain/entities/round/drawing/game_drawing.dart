import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

part 'game_drawing.freezed.dart';
part 'game_drawing.g.dart';

@freezed
class GameDrawing with _$GameDrawing {
  factory GameDrawing({
    required String id,
    required String roomId,
    required String roundId,
    required List<GameSketch> sketchList,
    required int turn,
    required int step,
    @TimeSerializer() required DateTime turnStartedAt,
    @TimeSerializer() required DateTime startedAt,
  }) = _GameDrawing;

  factory GameDrawing.fromJson(Map<String, dynamic> json) =>
      _$GameDrawingFromJson(json);
}
