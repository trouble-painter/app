import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/optimization/throttle.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_stroke.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';
import 'package:x_pr/features/game/v2/domain/usecase/game_optimize_drawing_usecase.dart';

class GameDrawingLoadedPageModel extends BaseViewModel<GameDrawingLoadedState> {
  GameDrawingLoadedPageModel(super.buildState);

  Timer? timer;
  StreamSubscription? subs;
  final Throttle _throttle = Throttle();

  GameRoundRepository get gameRoundRepository {
    return ref.read(GameRoundRepository.$);
  }

  GameDrawingRepository get gameDrawingRepository {
    return ref.read(GameDrawingRepository.$);
  }

  bool get isGameDevMode => ref.read(ConfigService.$).isGameDevMode;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final drawingSecLimit = state.round.setting.drawingSecLimit;
      final turnStartedAt = state.drawing.turnStartedAt;
      final secAfter = NetworkTime.now.difference(turnStartedAt).inSeconds;
      final secondsLeft = max(0, drawingSecLimit - secAfter);
      state = state.copyWith(secondsLeft: secondsLeft);

      if (state.isHost && secondsLeft < 1) {
        turnOver();
      }
    });
  }

  Future<void> subscribeDrawing() async {
    switch (await gameDrawingRepository.subscribe(state.drawing.id)) {
      case Success(value: final stream):
        subs = stream.listen((drawing) {
          if (state.drawing.turn != drawing.turn) {
            /// Turn changed
            Logger.d(
              "👂 [Drawings : turn changed] | ${state.drawing.turn} → ${drawing.turn}",
            );
            state = state.copyWith(
              drawing: drawing,
              strokesLeft: state.round.setting.drawingStokeLimit,
            );
            if (state.isMyTurn) {
              /// My turn
              Toast.showText(S.current.myTurn);
            }
          } else {
            /// Drawing
            state = state.copyWith(
              drawing: drawing,
            );
          }
        });
        return;
      case Failure():
        return;
      case Cancel():
        return;
    }
  }

  void onPointerDown(Offset offset, Size canvasSize) {
    if (!state.isDrawable) return;
    if (state.strokesLeft == 0) {
      state = state.copyWith(
        strokesLeft: state.strokesLeft - 1,
      );
      return;
    }
    final now = NetworkTime.now;
    final t = now.difference(state.drawing.turnStartedAt).inMilliseconds;
    final localSketch = GameSketch(
      strokeList: [
        ...state.localSketch.strokeList,
        GameStroke(
          x: [offset.dx],
          y: [offset.dy],
          t: [t.toDouble()],
        ),
      ],
      color: state.drawingPlayer.color,
      canvasSize: canvasSize,
    );
    state = state.copyWith(
      strokesLeft: state.strokesLeft - 1,
      lastPointedAt: now,
      localSketch: localSketch,
    );
  }

  void onPointerMove(Offset offset, Size canvasSize) {
    if (!state.isDrawable) return;
    _throttle.run(50, () {
      if (state.localSketch.strokeList.isEmpty) {
        onPointerDown(offset, canvasSize);
        return;
      }

      final localSketch = state.localSketch;
      final now = NetworkTime.now;
      final lastStroke = localSketch.strokeList.last;
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

      final nextLocalSketch = localSketch.copyWith(
        strokeList: [
          ...localSketch.strokeList.sublist(
            0,
            localSketch.strokeList.length - 1,
          ),
          optimizedStroke,
        ],
      );
      state = state.copyWith(
        lastPointedAt: now,
        localSketch: nextLocalSketch,
      );

      /// Update sketch list
      uploadSketch();
    });
  }

  void onPointerUp(Offset offset, Size canvasSize) async {
    if (!state.isDrawable) return;

    /// [Deprecated] Use only time limits
    /// End turn
    // if (state.strokesLeft <= 0) {
    //   turnOver();
    // }
  }

  Future<void> turnOver() async {
    final turn = state.drawing.turn;
    final isLastTurn = turn + 1 >= state.players.length;
    if (isLastTurn) {
      final step = state.drawing.step;
      if (step < state.round.setting.stepLimit) {
        /// Next step
        await gameDrawingRepository.updateStep(
          state.drawing.id,
          state.round,
          step + 1,
        );
      } else {
        /// Drawing finish
        Logger.d("Drawing finished!");
        goToVoting();
      }
    } else {
      /// Next turn
      await gameDrawingRepository.updateTurn(
        state.drawing.id,
        state.players,
        turn + 1,
      );
    }
  }

  void deleteSketch() {
    state = state.copyWith(
      strokesLeft: state.round.setting.drawingStokeLimit,
      localSketch: state.localSketch.copyWith(
        strokeList: [],
      ),
    );

    /// Update sketch list
    uploadSketch();
  }

  void uploadSketch() {
    /// Update sketch list
    gameDrawingRepository.updateSketchList(
      state.drawing.id,
      state.drawing.sketchList.asMap().entries.map((entry) {
        final (index, sketch) = (entry.key, entry.value);
        final (step, turn) = (state.drawing.step, state.drawing.turn);
        final currentTurn = (step - 1) * state.players.length + turn;
        return index == currentTurn ? state.localSketch : sketch;
      }).toList(),
    );
  }

  void reset() async {
    deleteSketch();
    await gameDrawingRepository.reset(
      state.drawing.copyWith(
        turn: 0,
        turnStartedAt: NetworkTime.now,
        sketchList: state.drawing.sketchList.map((sketch) {
          return sketch.copyWith(strokeList: []);
        }).toList(),
      ),
    );
  }

  Future<void> goToVoting() async {
    await gameRoundRepository.startVoting(state.round);
  }

  Future<void> goToWaiting() async {
    await gameRoundRepository.updateStep(
      state.round.id,
      GameRoundStep.waiting,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    subs?.cancel();
    super.dispose();
  }
}
