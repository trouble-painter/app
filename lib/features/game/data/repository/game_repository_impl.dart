import 'dart:async';

import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/game/data/repository/game_repository.dart';
import 'package:x_pr/features/game/data/source/remote_game_source.dart';
import 'package:x_pr/features/game/data/source/web_socket_source.dart';
import 'package:x_pr/features/game/domain/entities/game_channel.dart';

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl({
    required this.webSocketSource,
    required this.remoteGameSource,
  });

  final WebSocketSource webSocketSource;
  final RemoteGameSource remoteGameSource;

  @override
  Future<Result<GameChannel>> connect({
    required Uri uri,
    required Duration timeout,
  }) async {
    return webSocketSource.connect(uri.toString(), timeout);
  }

  @override
  Future<Result<String?>> getPlayingRoomId({required Jwt jwt}) {
    return remoteGameSource.getPlayingRoomId(jwt);
  }
}
