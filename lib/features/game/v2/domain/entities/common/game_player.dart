import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';

part 'game_player.freezed.dart';
part 'game_player.g.dart';

@freezed
class GamePlayer with _$GamePlayer {
  factory GamePlayer({
    required String id,
    required String nickname,
    @ColorSerializer() required Color color,
  }) = _GamePlayer;

  factory GamePlayer.fromJson(Map<String, dynamic> json) =>
      _$GamePlayerFromJson(json);
}
