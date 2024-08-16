import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

sealed class GameServiceState {}

class PreGameState extends GameServiceState {}

class InGameState extends GameServiceState {
  final GameRoom room;
  final GamePlayer player;

  List<GamePlayer> get players => room.players;
  bool get isHost => room.host == player.id;
  bool get isSpy => room.spy == player.id;

  InGameState(
    this.room,
    this.player,
  );

  @override
  String toString() => 'InGameState(room: $room)';
}
