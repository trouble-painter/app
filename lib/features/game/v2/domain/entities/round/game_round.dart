import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_keyword.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

part 'game_round.freezed.dart';
part 'game_round.g.dart';

@freezed
class GameRound with _$GameRound {
  factory GameRound({
    required String id,
    required String roomId,
    required String spyAnswer,
    required Map<int, int> voting,
    required String hostId,
    required String spyId,
    required int secondsLeft,
    required GameKeyword keyword,
    required List<GamePlayer> players,
    required GameRoundSetting setting,
    required GameRoundStep step,
    @TimeSerializer() required DateTime startedAt,
    String? drawingId,
  }) = _GameRound;

  const GameRound._();

  factory GameRound.fromJson(Map<String, dynamic> json) =>
      _$GameRoundFromJson(json);

  @override
  String toString() {
    return "GameRound(step: $step, secondsLeft: $secondsLeft)";
  }
}
