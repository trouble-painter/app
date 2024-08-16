import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';
import 'package:x_pr/core/utils/serializer/size_serializer.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_stroke.dart';

part 'game_sketch.freezed.dart';
part 'game_sketch.g.dart';

@freezed
class GameSketch with _$GameSketch {
  factory GameSketch({
    required List<GameStroke> strokeList,
    @SizeSerializer() required Size canvasSize,
    @ColorSerializer() required Color color,
  }) = _GameSketch;

  factory GameSketch.fromJson(Map<String, dynamic> json) =>
      _$GameSketchFromJson(json);
}
