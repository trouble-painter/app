import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/serializer/deep_serializer.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/data/source/game_room_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';

class GameRoomRepositoryImpl implements GameRoomRepository {
  GameRoomRepositoryImpl({required this.gameRoomFirestoreSource});
  final GameRoomFirestoreSource gameRoomFirestoreSource;

  final List<Color> brushColors = [
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.amber,
    Colors.brown,
    Colors.grey,
    Colors.pink,
  ];

  @override
  List<Color> notUsedColors(GameRoom room) {
    final playerColors =
        room.players.map((player) => player.color.value.toRadixString(16));
    return brushColors
        .where((color) => !playerColors.contains(color.value.toRadixString(16)))
        .toList();
  }

  @override
  Future<Result<GameRoom>> create(String uuid, String nickname) async {
    final roomid = const UuidV4().generate().split('-').first;
    final host = GamePlayer(
      id: uuid,
      nickname: nickname,
      color: brushColors.first,
    );
    final room = GameRoom(
      id: roomid,
      hostId: host.id,
      players: [host],
      createdAt: NetworkTime.now,
      maxPlayers: brushColors.length,

      /// Default setting
      setting: GameRoundSetting(
        waitingSec: 10,
        drawingSecLimit: 10,
        drawingStokeLimit: 1,
        stepLimit: 2,
        votingSecLimit: 10,
        spyAnsweringSecLimit: 30,
      ),
    );
    return gameRoomFirestoreSource.create(room);
  }

  @override
  Future<Result<GameRoom>> join({
    required String roomId,
    required String uuid,
    required String nickname,
  }) async {
    final result = await gameRoomFirestoreSource.get(roomId);
    return switch (result) {
      Success(value: final room) => room == null
          ? const Failure(GameRoomRepositoryException.notFound)
          : room.players.length >= room.maxPlayers
              ? const Failure(GameRoomRepositoryException.full)
              : await gameRoomFirestoreSource.join(
                  room,
                  GamePlayer(
                    id: uuid,
                    nickname: nickname,
                    color: notUsedColors(room).first,
                  ),
                ),
      Failure(e: final e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }

  @override
  Future<Result<Stream<GameRoom>>> subscribe(String roomId) {
    return gameRoomFirestoreSource.subscribe(roomId);
  }

  @override
  Future<Result<GameRoom>> get(String roomId) {
    throw UnimplementedError();
  }

  @override
  Future<Result<GameRoom?>> getLatest() {
    return gameRoomFirestoreSource.getLatest();
  }

  @override
  Future<Result<void>> left(GameRoom room, GamePlayer player) {
    return gameRoomFirestoreSource.left(room.id, player);
  }

  @override
  Future<Result<void>> linkToRound(GameRoom room, GameRound round) {
    return gameRoomFirestoreSource.update(room.id, {"roundId": round.id});
  }

  @override
  Future<Result<void>> unlinkToRound(GameRoom room, GameRound round) {
    return gameRoomFirestoreSource.deleteField(room.id, "roundId");
  }

  @override
  Future<Result<void>> clearPlayers(String roomId) {
    return gameRoomFirestoreSource.update(roomId, {
      "players": [],
    });
  }

  @override
  Future<Result<void>> updateSetting(GameRoom room) {
    return gameRoomFirestoreSource.update(room.id, {
      "setting": const DeepSerializer().toJson(room.setting.toJson()),
    });
  }
}
