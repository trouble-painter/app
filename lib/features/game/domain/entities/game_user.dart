import 'package:material_ui/material_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

part 'game_user.freezed.dart';

@freezed
abstract class GameUser with _$GameUser {
  factory GameUser({
    required int id,
    required String nickname,
    required bool isConnect,
    required PlayerColor playerColor,
  }) = _GameUser;

  GameUser._();

  Color get color => playerColor.drawing;

  Color get hatColor => playerColor.hat;
}
