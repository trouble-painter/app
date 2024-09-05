import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/game/data/repositories/game_repository_impl.dart';
import 'package:x_pr/features/game/data/sources/remote_game_source.dart';
import 'package:x_pr/features/game/data/sources/web_socket_source.dart';
import 'package:x_pr/features/game/domain/entities/game_channel.dart';

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
