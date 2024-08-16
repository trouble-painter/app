import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';
import 'package:x_pr/core/utils/serializer/size_serializer.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_stroke.dart';

part 'game_drawing.freezed.dart';
part 'game_drawing.g.dart';

@freezed
class GameDrawing with _$GameDrawing {
  factory GameDrawing({
    /// [
    ///   { First stroke
    ///     x: [0, 1, 2, 3, ...],
    ///     y: [0, 1, 2, 3, ...],
    ///     t: [0, 1, 2, 3, ...]
    ///   },
    ///   { Second stroke
    ///     x: [0, 1, 2, 3, ...],
    ///     y: [0, 1, 2, 3, ...],
    ///     t: [0, 1, 2, 3, ...]
    ///   },
    /// ]
    required List<GameStroke> strokeList,
    @SizeSerializer() required Size canvasSize,
    @ColorSerializer() required Color color,
    required String player,
  }) = _GameDrawing;

  factory GameDrawing.fromJson(Map<String, dynamic> json) =>
      _$GameDrawingFromJson(json);
}
