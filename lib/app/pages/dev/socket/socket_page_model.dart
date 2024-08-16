import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:x_pr/app/pages/dev/socket/socket_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v3/data/repository/game_repository.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_req/game_req.dart';

class SocketPageModel extends BaseViewModel<SocketPageState> {
  SocketPageModel(super.buildState);

  StreamSubscription? subs;
  late WebSocketChannel channel;

  GameRepository get gameRepository => ref.read(GameRepository.$);
  Config get config => ref.read(ConfigService.$);

  void connect() async {
    state = SocketLoadingState();
    final result = await gameRepository.connect(
      uri: config.baseSocketUrl,
      timeout: Constant.connectionTimeout,
    );
    switch (result) {
      case Success(value: final channel):
        Logger.d("🔗 GameChannel connected : $channel");
        state = SocketConnectedState(channel: channel, responseList: []);
        subs = channel.stream.listen(
          (res) {
            Logger.d('👂 GameChannel Listen : $res');
            state = SocketConnectedState(
              channel: channel,
              responseList: switch (state) {
                SocketConnectedState(responseList: final messages) => [
                    ...messages,
                    res,
                  ],
                _ => [res],
              },
            );
          },
          onError: (error) {
            Logger.e(error);
          },
          onDone: () {
            Logger.d("👋 GameChannel Disconnected");
            subs?.cancel();
            state = SocketDisconnectedState();
          },
          cancelOnError: true,
        );
        return;
      case Failure():
        state = SocketDisconnectedState();
        return;
      case Cancel():
        state = SocketDisconnectedState();
        return;
    }
  }

  void enterRoom([String? roomId]) {
    switch (state) {
      case SocketConnectedState(
          channel: final channel,
        ):
        channel.send(
          GameEnterReq(
            nickname: config.nickname,
            language: config.language,
            jwt: Jwt(
              userId: 1,
              refreshToken: "refreshToken",
              accessToken: "accessToken",
            ),
            roomId: "VD44RO",
          ),
        );
        return;
      default:
        return;
    }
  }

  @override
  void dispose() {
    subs?.cancel();
    super.dispose();
  }
}
