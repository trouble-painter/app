import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';

part 'game_room.freezed.dart';
part 'game_room.g.dart';

@freezed
class GameRoom with _$GameRoom {
  factory GameRoom({
    required String id,
    required String hostId,
    required int maxPlayers,
    required List<GamePlayer> players,
    required GameRoundSetting setting,
    @TimeSerializer() required DateTime createdAt,
    String? roundId,
  }) = _GameRoom;

  factory GameRoom.fromJson(Map<String, dynamic> json) =>
      _$GameRoomFromJson(json);
}
