import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_round_setting.freezed.dart';
part 'game_round_setting.g.dart';

@freezed
class GameRoundSetting with _$GameRoundSetting {
  factory GameRoundSetting({
    required int waitingSec,
    required int drawingSecLimit,
    required int drawingStokeLimit,
    required int stepLimit,
    required int votingSecLimit,
    required int spyAnsweringSecLimit,
  }) = _GameRoundSetting;

  factory GameRoundSetting.fromJson(Map<String, dynamic> json) =>
      _$GameRoundSettingFromJson(json);
}
