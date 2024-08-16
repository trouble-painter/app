import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/optimization/throttle.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v3/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/v3/domain/entities/drawing/stroke.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';
import 'package:x_pr/features/game/v3/domain/usecase/optimize_stroke_usecase.dart';

abstract class GameDrawingPageModel extends BaseViewModel<GameDrawingState> {
  GameDrawingPageModel(super.buildState);
  final _throttle = Throttle();

  final AutoScrollController scrollController = AutoScrollController();
  late Config config = ref.read(ConfigService.$);
  GameService get gameService => ref.read(GameService.$.notifier);
  Timer? timer;

  void onStateChanged(GameDrawingState? oldState) {
    if (oldState?.currentTurn != state.currentTurn) {
      /// On turn changed
      scrollController.scrollToIndex(
        state.currentTurn,
        preferPosition: AutoScrollPosition.middle,
      );
    }

    /// Remote round animation
    if (state.stage == GameDrawingStage.round) {
      reserveRoundAnimRemoveTimer();
    }

    switch (state.exception) {
      case GameException.notMyTurn:
        Toast.showText(GameException.notMyTurn.toast);
        break;
      default:
        break;
    }
  }

  void reserveRoundAnimRemoveTimer() {
    if (state.stage != GameDrawingStage.round) return;
    final remainRoundAnimDuration = state.remainRoundAnimDuration;
    if (remainRoundAnimDuration.isNegative) {
      gameService.emit(
        state.copyWith(
          stage: GameDrawingStage.play,
        ),
      );
      return;
    } else {
      timer?.cancel();
      timer = Timer.periodic(remainRoundAnimDuration, (_) {
        timer?.cancel();
        gameService.emit(
          state.copyWith(
            stage: GameDrawingStage.play,
          ),
        );
      });
    }
  }

  void endTurn();

  void onSketch(Sketch sketch);

  void deleteSketch() {
    final isSuccess = gameService.emit(
      state.copyWith(
        strokesLeft: state.maxStroke,
        currentSketch: state.currentSketch.copyWith(
          strokeList: [],
        ),
      ),
    );

    /// Update sketch list
    if (isSuccess) {
      onSketch(state.currentSketch);
    }
  }

  void onPointerDown(Offset offset, Size canvasSize) {
    if (!state.isDrawable) return;
    if (state.strokesLeft == 0) {
      gameService.emit(
        state.copyWith(
          strokesLeft: state.strokesLeft - 1,
        ),
      );
      return;
    }
    final now = NetworkTime.now;
    final t = now.difference(state.currentTurnStartedAt).inMilliseconds;
    final currentSketch = Sketch(
      userId: state.me.id,
      strokeList: [
        ...state.currentSketch.strokeList,
        Stroke(
          x: [offset.dx],
          y: [offset.dy],
          t: [t.toDouble()],
        ),
      ],
      color: state.me.color,
      canvasSize: canvasSize,
    );
    final isSuccess = gameService.emit(
      state.copyWith(
        strokesLeft: state.strokesLeft - 1,
        lastPointedAt: now,
        currentSketch: currentSketch,
      ),
    );

    if (isSuccess) {
      /// Update sketch list
      onSketch(state.currentSketch);
    }
  }

  void onPointerMove(Offset offset, Size canvasSize) {
    _throttle.run(config.drawingThrottleMs, () {
      if (!state.isDrawable) return;
      if (state.currentSketch.strokeList.isEmpty) {
        onPointerDown(offset, canvasSize);
        return;
      }
      final Sketch localSketch = state.currentSketch;
      final now = NetworkTime.now;
      final lastStroke = localSketch.strokeList.last;
      final t = now.difference(state.lastPointedAt ?? now).inMilliseconds;

      /// Optimization
      final currentStroke = lastStroke.copyWith(
        x: [...lastStroke.x, offset.dx],
        y: [...lastStroke.y, offset.dy],
        t: [...lastStroke.t, t.toDouble()],
      );
      final optimizedStroke = ref.read(OptimizeStrokeUsecase.$).call(
            OptimizeStrokeUsecaseParam(
              epsilion: config.drawOptimizeEpsilion,
              stroke: currentStroke,
            ),
          );

      /// Max drawing points limit
      if (optimizedStroke.length >= config.maxDrawingPoints) {
        Logger.d(
          "Overflow maxDrawingPoints(${config.maxDrawingPoints}) : ${optimizedStroke.length}",
        );
        return;
      }

      final nextLocalSketch = localSketch.copyWith(
        strokeList: [
          ...localSketch.strokeList.sublist(
            0,
            localSketch.strokeList.length - 1,
          ),
          optimizedStroke,
        ],
      );
      gameService.emit(
        state.copyWith(
          lastPointedAt: now,
          currentSketch: nextLocalSketch,
        ),
      );

      /// Update sketch list
      onSketch(state.currentSketch);
    });
  }

  void onPointerUp(Offset offset, Size canvasSize) async {}

  /// For test
  void goNext() {}

  /// For test
  void reset() {}

  /// For test
  void nextSection() {}

  /// For test
  void toggleIsMafia() {}

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
