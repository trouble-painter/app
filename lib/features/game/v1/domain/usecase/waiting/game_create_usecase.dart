import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/v4.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/v1/data/repository/game_keyword_repository.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

class GameCreateUsecaseParam {
  final String uid;
  final String nickname;
  final int maxPlayers;
  final int timeLimitSec;

  GameCreateUsecaseParam({
    required this.uid,
    required this.nickname,
    required this.maxPlayers,
    required this.timeLimitSec,
  });
}

class GameCreateUsecase
    implements BaseUsecase<GameCreateUsecaseParam, Future<Result<GameRoom>>> {
  static final $ = AutoDisposeProvider<GameCreateUsecase>((ref) {
    return GameCreateUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
      gameKeywordRepository: ref.read(GameKeywordRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  final GameKeywordRepository gameKeywordRepository;
  GameCreateUsecase({
    required this.gameRoomRepository,
    required this.gameKeywordRepository,
  });

  @override
  Future<Result<GameRoom>> call(GameCreateUsecaseParam param) async {
    /// Create room id
    final roomid = const UuidV4().generate().split('-').first;

    /// Create host
    final host = GamePlayer(
      id: param.uid,
      nickname: param.nickname,
      color: Colors.primaries[0],
    );

    final keyword = await gameKeywordRepository.random();
    final room = GameRoom(
      id: roomid,
      host: host.id,
      maxPlayers: param.maxPlayers,
      timeLimitSec: param.timeLimitSec,
      players: [host],
      state: GameRoomState.waiting,
      keyword: keyword,
      strokeLeft: 1,
      currentDrawingOrder: 0,
      createdAt: NetworkTime.now,

      /// Scheduled to change when game starts.
      spy: host.id,
      drawingOrder: [host.id],
    );
    return gameRoomRepository.create(room);
  }
}
