import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository_impl.dart';
import 'package:trouble_painter/features/game/data/sources/remote_game_source.dart';
import 'package:trouble_painter/features/game/data/sources/web_socket_source.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';

abstract interface class GameRepository {
  static final $ = Provider.autoDispose<GameRepository>((ref) {
    return GameRepositoryImpl(
      webSocketSource: ref.read(WebSocketSource.$),
      remoteGameSource: ref.read(RemoteGameSource.$),
    );
  });

  Future<Result<GameChannel>> connect({
    required Uri baseSocketUrl,
    required String accessToken,
    required Duration timeout,
  });

  Future<Result<String?>> getPlayingRoomId({required Jwt jwt});

  Future<Result<int>> getRoomCodeLength();
}
