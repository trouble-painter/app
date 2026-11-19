import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/usecases/get_jwt_usecase.dart';
import 'package:trouble_painter/features/network/domain/entities/network_state.dart';
import 'package:trouble_painter/features/network/domain/services/network_service.dart';

class ConnectUsecaseParam {
  final Duration timeout;

  ConnectUsecaseParam(this.timeout);
}

typedef ConnectUsecaseResult = ({Jwt jwt, GameChannel channel});

/// Opens the game socket. On HTTP 401, reissues the token and tries once more.
class ConnectUsecase
    implements BaseUsecase<ConnectUsecaseParam, Future<ConnectUsecaseResult>> {
  static final $ = Provider.autoDispose<ConnectUsecase>((ref) {
    return ConnectUsecase(
      gameRepository: ref.read(GameRepository.$),
      getNetworkState: () => ref.read(NetworkService.$),
      getBaseSocketUrl: () => ref.read(ConfigService.$).baseSocketUrl,
      getJwt: (param) => ref.read(GetJwtUsecase.$).call(param),
    );
  });

  ConnectUsecase({
    required this.gameRepository,
    required this.getNetworkState,
    required this.getBaseSocketUrl,
    required this.getJwt,
  });

  final GameRepository gameRepository;
  final NetworkState Function() getNetworkState;
  final Uri Function() getBaseSocketUrl;
  final Future<Jwt> Function(GetJwtUsecaseParam param) getJwt;

  @override
  Future<ConnectUsecaseResult> call(ConnectUsecaseParam param) async {
    if (getNetworkState() == NetworkState.disconnected) {
      throw GameException.networkNotConnected;
    }
    try {
      return await _connect(const GetJwtUsecaseParam(), param.timeout);
    } on GameException catch (e) {
      if (e != GameException.unauthenticated) rethrow;
      return await _connect(
        const GetJwtUsecaseParam(forceRefresh: true),
        param.timeout,
      );
    }
  }

  Future<ConnectUsecaseResult> _connect(
    GetJwtUsecaseParam jwtParam,
    Duration timeout,
  ) async {
    final jwt = await getJwt(jwtParam);
    final result = await gameRepository.connect(
      baseSocketUrl: getBaseSocketUrl(),
      accessToken: jwt.accessToken,
      timeout: timeout,
    );
    return switch (result) {
      Success(value: final channel) => (jwt: jwt, channel: channel),
      Failure(e: final e) => throw e,
      Cancel() => throw const Cancel(),
    };
  }
}
