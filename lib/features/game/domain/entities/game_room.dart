import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

part 'game_room.freezed.dart';
part 'game_room.g.dart';

@freezed
class GameRoom with _$GameRoom {
  factory GameRoom({
    required String roomId,
    required List<GameUser> users,
  }) = _GameRoom;

  factory GameRoom.fromJson(Map<String, dynamic> json) =>
      _$GameRoomFromJson(json);
}
