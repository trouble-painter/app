import 'dart:async';

import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:x_pr/core/utils/ext/string_ext.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/game/data/models/x/raw/x_game_raw.dart';
import 'package:x_pr/features/game/data/models/x/raw/x_game_raw_state.dart';
import 'package:x_pr/features/game/data/models/x/req/x_game_req.dart';
import 'package:x_pr/features/game/data/models/x/req/x_game_req_action.dart';
import 'package:x_pr/features/game/data/models/x/res/x_game_res.dart';
import 'package:x_pr/features/game/data/models/x/x_game_info.dart';
import 'package:x_pr/features/game/domain/entities/game_channel.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';

class XGameChannel implements GameChannel {
  XGameChannel(this.channel);

  @override
  final WebSocketChannel channel;

  @override
  void close() {
    channel.sink.close(status.normalClosure);
  }

  @override
  void send(GameReq req) {
    final xGameReq = switch (req) {
      GameEnterReq() => XGameEnterReq.fromEntiry(req),
      GameStartReq() => XGameStartReq.fromEntiry(req),
      GameEndTurnReq() => XGameEndTurnReq.fromEntiry(req),
      GameVoteReq() => XGameVoteReq.fromEntiry(req),
      GameAnswerReq() => XGameAnswerReq.fromEntiry(req),
      GameSubmitAnswerReq() => XGameSubmitAnswerReq.fromEntiry(req),
      GameDrawReq() => XGameDrawReq.fromEntiry(req),
      GameRestartReq() => XGameRestartReq.fromEntiry(req),
      GameQuickStartReq() => XGameQuickStartReq.fromEntiry(req),
      GameReactionReq() => XGameReactionReq.fromEntiry(req),
    };
    Logger.d("🧩 🟠 XGameReq | $xGameReq");
    channel.sink.add(xGameReq.toString());
  }

  @override
  Stream<XGameRes> get stream {
    return channel.stream.transform<XGameRes>(
      StreamTransformer.fromHandlers(
        handleData: (text, sink) {
          Logger.d("🧩 ⚪️ XGameRaw | $text");
          final XGameRaw raw = XGameRaw.fromServer(text);
          try {
            return switch (raw.status) {
              XGameRawStatus.error => _onError(sink, raw),
              XGameRawStatus.ok => _onOk(sink, raw),
            };
          } catch (e, s) {
            Logger.e("Failed to convert XGameRow to XGameRes", e, s);
            sink.add(
              XGameException(
                code: XGameExceptionCode.error,
                action: XGameReqAction.unknown,
                title: "$e",
                description: "$s",
              ),
            );
          }
        },
      ),
    );
  }

  /// Convert [XGameRaw] to [XGameException]
  void _onError(EventSink<XGameRes> sink, XGameRaw raw) {
    sink.add(XGameException.fromXGameRaw(raw));
  }

  /// Convert [XGameRaw] to [XGamePhase] or [XGamePatch].
  /// [XGameReadyPhase] Received once upon entry or when entering mid-game.
  late XGameInfo _gameInfo;
  void _onOk(EventSink<XGameRes> sink, XGameRaw raw) {
    final Map<String, dynamic> json = raw.data;

    /// XGamePhase
    for (final action in XGamePhaseType.values) {
      if (!action.action.eq(raw.action)) continue;

      /// Update _gameInfo
      final gameInfoJson = json['mafiaGameInfo']?['body'];
      if (gameInfoJson != null) {
        _gameInfo = XGameInfo.fromJson(gameInfoJson);
      }

      sink.add(
        switch (action) {
          XGamePhaseType.quickStartWaiting => XGameQuickStartWaitingPhase(),
          XGamePhaseType.waiting => XGameWaitingPhase.fromJson(json),
          XGamePhaseType.ready => XGameReadyPhase.fromJson(json, _gameInfo),
          XGamePhaseType.drawing => XGameDrawingPhase.fromJson(json, _gameInfo),
          XGamePhaseType.vote => XGameVotePhase.fromJson(json, _gameInfo),
          XGamePhaseType.guess => XGameGuessPhase.fromJson(json, _gameInfo),
          XGamePhaseType.end => XGameResultPhase.fromJson(json, _gameInfo),
        },
      );
      return;
    }

    /// XGamePatch
    for (final action in XGamePatchType.values) {
      if (!action.action.eq(raw.action)) continue;
      sink.add(
        switch (action) {
          XGamePatchType.playerList => XGamePlayerListPatch.fromJson(json),
          XGamePatchType.turnInfo => XGameTurnInfoPatch.fromJson(json),
          XGamePatchType.voteStatus => XGameVoteStatusPatch.fromJson(json),
          XGamePatchType.answer => XGameAnswerPatch.fromJson(json),
          XGamePatchType.draw => XGameDrawPatch.fromJson(json),
          XGamePatchType.reaction => XGameReactionPatch.fromJson(json),
        },
      );
      return;
    }
  }
}
