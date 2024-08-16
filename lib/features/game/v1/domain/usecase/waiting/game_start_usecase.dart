import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_keyword_repository.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

class GameStartUsecaseParam {
  final GameRoom room;
  final GamePlayer player;

  GameStartUsecaseParam(
    this.room,
    this.player,
  );
}

class GameStartUsecase
    implements BaseUsecase<GameStartUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameStartUsecase>((ref) {
    return GameStartUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
      gameKeywordRepository: ref.read(GameKeywordRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  final GameKeywordRepository gameKeywordRepository;
  GameStartUsecase({
    required this.gameRoomRepository,
    required this.gameKeywordRepository,
  });

  @override
  Future<Result<void>> call(GameStartUsecaseParam param) async {
    final (room, player, players) = (
      param.room,
      param.player,
      param.room.players,
    );
    assert(room.host == player.id);
    assert(room.state == GameRoomState.waiting);
    final spy = players[Random().nextInt(players.length)];
    final drawingOrder = players.map((player) => player.id).toList()..shuffle();
    final playingRoom = room.copyWith(
      spy: spy.id,
      state: GameRoomState.assigning,
      drawingOrder: drawingOrder,
    );
    return await gameRoomRepository.start(playingRoom);
  }
}
