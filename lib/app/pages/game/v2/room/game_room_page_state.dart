import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';

sealed class GameRoomPageState {}

class GameRoomInitState extends GameRoomPageState {}

class GameRoomFailureState extends GameRoomPageState {}

class GameRoomLoadedState extends GameRoomPageState {
  final GameRoom room;
  final GamePlayer player;
  
  GameRoundSetting get setting => room.setting;

  bool get isHost => player.id == room.hostId;

  GameRoomLoadedState(
    this.room,
    this.player,
  );
  GameRoomLoadedState copyWith({
    GameRoom? room,
    GamePlayer? player,
  }) {
    return GameRoomLoadedState(
      room ?? this.room,
      player ?? this.player,
    );
  }
}

class GameRoomRoundStartedState extends GameRoomPageState {
  final GameRound round;

  GameRoomRoundStartedState(this.round);
}
