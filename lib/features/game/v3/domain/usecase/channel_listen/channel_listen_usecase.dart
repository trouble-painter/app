import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/game/v3/data/models/x/res/x_game_res.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_channel.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';

part 'channel_listen_param.dart';
part 'channel_listen_result.dart';

class ChannelListenUsecase
    implements BaseUsecase<ChannelListenParam, StreamSubscription> {
  static final $ = Provider<ChannelListenUsecase>((ref) {
    final subscribeUsecase = ChannelListenUsecase();
    return subscribeUsecase;
  });

  GameState? gameState;

  @override
  StreamSubscription call(ChannelListenParam param) {
    _init();
    return param.channel.stream.listen(
      (gameRes) {
        switch (gameRes) {
          /// Exception
          case XGameException():
            Logger.d("🧩 🟤 XGameException | $gameRes");
            _handleGameException(param.exception$Ctrl, gameRes);
            return;

          /// Phase
          case XGamePhase():
            Logger.d("🧩 🟤 XGamePhase | $gameRes");
            _handleGamePhase(param.jwt.userId, param.state$Ctrl, gameRes);
            return;

          /// Patch
          case XGamePatch():
            Logger.d("🧩 🟤 XGamePatch | $gameRes");
            _handleGamePatch(param.jwt.userId, param.state$Ctrl, gameRes);
            return;
        }
      },
      onDone: () {
        Logger.d("🧩 👋 GameChannel Disconnected");
        param.exception$Ctrl.add(GameException.channelDisconnected);
        _init();
      },
    );
  }

  void _init() {
    gameState = null;
  }

  void _handleGameException(
    StreamController<GameException> exception$Ctrl,
    XGameException exception,
  ) {
    exception$Ctrl.add(exception.code.toEntity());
  }

  /// Convert [XGamePhase] to [GameState]
  void _handleGamePhase(
    int myId,
    StreamController<GameState> state$Ctrl,
    XGamePhase phase,
  ) {
    gameState = phase.toEntity(myId);
    state$Ctrl.add(gameState!);
  }

  void _handleGamePatch(
    int userId,
    StreamController<GameState> state$Ctrl,
    XGamePatch patch,
  ) {
    if (gameState == null) return;
    try {
      gameState = patch.call(gameState!);
      state$Ctrl.add(gameState!);
    } catch (e) {
      Logger.d("🧩 Skep patch", e);
    }
  }
}
