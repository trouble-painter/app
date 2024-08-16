import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameJoinUsecaseParam {
  final String uid;
  final String nickname;
  final String roomId;

  GameJoinUsecaseParam({
    required this.uid,
    required this.nickname,
    required this.roomId,
  });
}

enum GameJoinUsecaseException { full, notFound }

class GameJoinUsecase
    implements BaseUsecase<GameJoinUsecaseParam, Future<Result<GameRoom>>> {
  static final $ = AutoDisposeProvider<GameJoinUsecase>((ref) {
    return GameJoinUsecase(gameRoomRepository: ref.read(GameRoomRepository.$));
  });

  final GameRoomRepository gameRoomRepository;
  GameJoinUsecase({required this.gameRoomRepository});

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
  Future<Result<GameRoom>> call(GameJoinUsecaseParam param) async {
    return switch (await gameRoomRepository.get(param.roomId)) {
      Success(value: GameRoom room) => _join(param, room),
      Failure(e: Object? e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }

  Future<Result<GameRoom>> _join(
    GameJoinUsecaseParam param,
    GameRoom room,
  ) async {
    /// The room is full.
    if (room.players.length >= room.maxPlayers) {
      return const Failure(GameJoinUsecaseException.full);
    }
    final colorIndex = room.players.length % brushColors.length;
    final color = brushColors[colorIndex];
    final player = GamePlayer(
      id: param.uid,
      nickname: param.nickname,
      color: color,
    );
    return gameRoomRepository.join(room: room, player: player);
  }
}
