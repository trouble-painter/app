import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

sealed class GameRoundPageState {}

class GameRoundInitState extends GameRoundPageState {}

class GameRoundFailureState extends GameRoundPageState {}

class GameRoundLoadedState extends GameRoundPageState {
  final GameRound round;
  final GamePlayer player;

  bool get isSpy => player.id == round.spyId;
  bool get isHost => player.id == round.hostId;
  GamePlayer get spy => round.players.firstWhere((p) => p.id == round.spyId);
  int get myTurn => round.players.indexWhere((p) => p.id == player.id);

  GameRoundLoadedState(this.round, this.player);
  GameRoundLoadedState copyWith({
    GameRound? round,
    GamePlayer? player,
  }) {
    return GameRoundLoadedState(
      round ?? this.round,
      player ?? this.player,
    );
  }
}
