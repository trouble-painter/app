import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';

part 'game_user.freezed.dart';
part 'game_user.g.dart';

@freezed
class GameUser with _$GameUser {
  factory GameUser({
    required int id,
    required String nickname,
    required bool isConnect,
    @JsonKey(name: "colorCode") @ColorSerializer() required Color color,
  }) = _GameUser;

  GameUser._();

  factory GameUser.fromJson(Map<String, dynamic> json) =>
      _$GameUserFromJson(json);

  Color get hatColor {
    if (color == Palette.drawingRed) return Palette.hatRed;
    if (color == Palette.drawingOrange) return Palette.hatOrange;
    if (color == Palette.drawingYellow) return Palette.hatYello;
    if (color == Palette.drawingLightGreen) return Palette.hatLightGreen;
    if (color == Palette.drawingGreen) return Palette.hatGreen;
    if (color == Palette.drawingLightBlue) return Palette.hatLightBlue;
    if (color == Palette.drawingBlue) return Palette.hatBlue;
    if (color == Palette.drawingPurple) return Palette.hatPurple;
    if (color == Palette.drawingPink) return Palette.hatPink;
    if (color == Palette.drawingGray) return Palette.hatGray;
    return Palette.hatGray;
  }
}
