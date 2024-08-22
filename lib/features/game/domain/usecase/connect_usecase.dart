import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/data/repository/game_repository.dart';
import 'package:x_pr/features/game/domain/entities/game_channel.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/network/domain/entity/network_state.dart';
import 'package:x_pr/features/network/domain/service/network_service.dart';

class ConnectUsecaseParam {
  final Duration timeout;

  ConnectUsecaseParam(this.timeout);
}

class ConnectUsecase
    implements BaseUsecase<ConnectUsecaseParam, Future<GameChannel>> {
  static final $ = AutoDisposeProvider<ConnectUsecase>((ref) {
    return ConnectUsecase(
      gameRepository: ref.read(GameRepository.$),
      networkState: ref.read(NetworkService.$),
      config: ref.read(ConfigService.$),
    );
  });

  ConnectUsecase({
    required this.gameRepository,
    required this.networkState,
    required this.config,
  });

  final NetworkState networkState;
  final GameRepository gameRepository;
  final Config config;

  @override
  Future<GameChannel> call(ConnectUsecaseParam param) async {
    switch (networkState) {
      case NetworkState.connected:
        return await _connect(
          config.baseSocketUrl,
          param.timeout,
        );
      case NetworkState.disconnected:
        throw GameException.networkNotConnected;
    }
  }

  Future<GameChannel> _connect(Uri uri, Duration timeout) async {
    return switch (await gameRepository.connect(
      uri: uri,
      timeout: timeout,
    )) {
      Success(value: final channel) => channel,
      Failure(e: final e) => throw e,
      Cancel() => throw const Cancel(),
    };
  }
}
