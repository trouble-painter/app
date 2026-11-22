import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';
import 'package:trouble_painter/features/game/data/sources/remote_game_source.dart';
import 'package:trouble_painter/features/game/data/sources/web_socket_source.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl({
    required this.webSocketSource,
    required this.remoteGameSource,
  });

  final WebSocketSource webSocketSource;
  final RemoteGameSource remoteGameSource;

  @override
  Future<Result<GameChannel>> connect({
    required Uri baseSocketUrl,
    required String accessToken,
    required Duration timeout,
  }) {
    return webSocketSource.connect(
      baseSocketUrl: baseSocketUrl,
      accessToken: accessToken,
      timeout: timeout,
    );
  }

  @override
  Future<Result<String?>> getPlayingRoomId({required Jwt jwt}) {
    return remoteGameSource.getPlayingRoomId(jwt);
  }

  @override
  Future<Result<int>> getRoomCodeLength() {
    return remoteGameSource.getRoomCodeLength();
  }
}
