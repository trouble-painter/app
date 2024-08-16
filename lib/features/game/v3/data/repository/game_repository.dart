import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/game/v3/data/repository/game_repository_impl.dart';
import 'package:x_pr/features/game/v3/data/source/remote_game_source.dart';
import 'package:x_pr/features/game/v3/data/source/web_socket_source.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_channel.dart';

abstract interface class GameRepository {
  static final $ = AutoDisposeProvider<GameRepository>((ref) {
    return GameRepositoryImpl(
      webSocketSource: ref.read(WebSocketSource.$),
      remoteGameSource: ref.read(RemoteGameSource.$),
    );
  });

  Future<Result<GameChannel>> connect({
    required Uri uri,
    required Duration timeout,
  });

  Future<Result<String?>> getPlayingRoomId({required Jwt jwt});
}
