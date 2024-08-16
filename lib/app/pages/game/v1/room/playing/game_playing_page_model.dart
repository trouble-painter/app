import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/game_playing_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/optimization/throttle.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_stroke.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_change_step_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_reset_turn_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/playing/game_add_drawing_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/playing/game_end_turn_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/playing/game_optimize_drawing_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/playing/game_subscribe_drawing_usecase.dart';

class GamePlayingPageModel extends BaseViewModel<GamePlayingPageState> {
  GamePlayingPageModel(super.buildState);

  static const isUploadDrawingToServer = true;
  final Throttle _throttle = Throttle();
  StreamSubscription? subs;

  Future<void> subscribeDrawing() async {
    final result = await ref.read(GameSubscribeDrawingUsecase.$).call(
          state.inGameState.room,
        );
    switch (result) {
      case Success(value: final stream):
        subs = stream.listen((remoteDrawingList) {
          state = state.copyWith(remoteDrawingList: remoteDrawingList);
          Logger.d("🎨 listen : $state");
        });
        break;
      case Failure():
        break;
      case Cancel():
        break;
    }
  }

  void onPointerDown(Offset offset, Size canvasSize) {
    final now = NetworkTime.now;
    final t = now.difference(state.turnStartedAt).inMilliseconds;
    final localDrawing = GameDrawing(
      strokeList: [
        if (state.localDrawing != null) ...state.localDrawing!.strokeList,

        /// Add new stroke
        GameStroke(
          x: [offset.dx],
          y: [offset.dy],
          t: [t.toDouble()],
        ),
      ],
      player: state.drawingPlayer.id,
      color: state.drawingPlayer.color,
      canvasSize: canvasSize,
    );
    state = state.copyWith(
      lastPointedAt: now,
      localDrawing: localDrawing,
    );
  }

  void onPointerMove(Offset offset, Size canvasSize) {
    _throttle.run(100, () {
      if (state.localDrawing == null ||
          state.localDrawing!.strokeList.isEmpty) {
        onPointerDown(offset, canvasSize);
        return;
      }

      final localDrawing = state.localDrawing!;
      final now = NetworkTime.now;
      final lastStroke = localDrawing.strokeList.last;
      final t = now.difference(state.lastPointedAt ?? now).inMilliseconds;

      /// Optimization
      final currentStroke = lastStroke.copyWith(
        x: [...lastStroke.x, offset.dx],
        y: [...lastStroke.y, offset.dy],
        t: [...lastStroke.t, t.toDouble()],
      );
      final optimizedStroke = ref.read(GameOptimizeDrawingUsecase.$).call(
            GameOptimizeDrawingUsecaseParam(
              epsilion: 0.1,
              stroke: currentStroke,
            ),
          );

      state = state.copyWith(
        lastPointedAt: now,
        localDrawing: localDrawing.copyWith(
          strokeList: [
            ...localDrawing.strokeList.sublist(
              0,
              localDrawing.strokeList.length - 1,
            ),
            optimizedStroke,
          ],
        ),
      );
      // Logger.d("Strokes ${localDrawing.strokeList}");

      /// Add drawing
      if (isUploadDrawingToServer) {
        final addDrawingParam = GameAddDrawingUsecaseParam(
          state.inGameState.room,
          localDrawing,
        );
        ref.read(GameAddDrawingUsecase.$).call(addDrawingParam);
      }
    });
  }

  void onPointerUp(Offset offset, Size canvasSize) async {
    final strokesLeft = state.strokesLeft - 1;
    state = state.copyWith(
      strokesLeft: strokesLeft,
    );

    if (strokesLeft <= 0) {
      /// End turn
      await ref.read(GameEndTurnUsecase.$).call(state.inGameState.room);
    }
  }

  Future<void> backToAssigning() async {
    final param = GameChangeStepUsecaseParam(
      room: state.room,
      step: GameRoomState.assigning,
    );
    await ref.read(GameChangeStepUsecase.$).call(param);
  }

  Future<void> resetTurn() async {
    await ref.read(GameResetTurnUsecase.$).call(state.room);
  }

  @override
  void dispose() {
    subs?.cancel();
    super.dispose();
  }
}
