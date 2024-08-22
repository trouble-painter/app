import 'package:freezed_annotation/freezed_annotation.dart';

part 'x_game_option.freezed.dart';
part 'x_game_option.g.dart';

@freezed
class XGameOption with _$XGameOption {
  factory XGameOption({
    required int minimum,
    required int maximum,
    required int readyTime,
    required int introAnimationTime,
    required int roundAnimationTime,
    required int round,
    required int turnTime,
    required int endTime,

    /// Maximum number of strokes per turn
    required int turnCount,
    required int voteTime,
    required int answerTime,
  }) = _XGameOption;

  factory XGameOption.fromJson(Map<String, dynamic> json) =>
      _$XGameOptionFromJson(json);
}
