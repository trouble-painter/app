import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_keyword.dart';

part 'game_room.freezed.dart';
part 'game_room.g.dart';

@freezed
class GameRoom with _$GameRoom {
  factory GameRoom({
    required String id,
    required String host,
    required int maxPlayers,
    required int timeLimitSec,
    required List<GamePlayer> players,
    required GameRoomState state,
    @TimeSerializer() required DateTime createdAt,

    /// Playing
    required String spy,
    required GameKeyword keyword,
    required int strokeLeft,
    required int currentDrawingOrder,
    required List<String> drawingOrder,

    /// Voting
  }) = _GameRoom;

  const GameRoom._();

  factory GameRoom.fromJson(Map<String, dynamic> json) =>
      _$GameRoomFromJson(json);

  @override
  String toString() {
    return 'GameRoom(state: $state, currentDrawingOrder: $currentDrawingOrder, players: ${players.length})';
  }
}
