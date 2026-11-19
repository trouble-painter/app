import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_reaction_overlay.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/optimization/throttle.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/optimize_stroke_usecase.dart';

abstract class GameDrawingPageModel extends BaseViewModel<GameDrawingState> {
  GameDrawingPageModel(super.buildState);
  final _sendSketchThrottle = Throttle();
  final reactionThrottle = Throttle();

  final AutoScrollController scrollCtrl = AutoScrollController();
  Config get config => ref.read(ConfigService.$);
  late final AnalyticsService analyticsService = ref.read(AnalyticsService.$);
  late final GameService gameService = ref.read(GameService.$.notifier);
  final GlobalKey<GameDrawingReactionOverlayState> reactionOverlayKey =
      GlobalKey();

  /// Reactions of scrolled away users are spread over the canvas.
  final GlobalKey canvasKey = GlobalKey();
  StreamSubscription? reactionSubs;

  DrawingPageEventInfo get _eventInfo => DrawingPageEventInfo(
        round: state.currentRound,
        turn: state.currentTurn,
        remainTurnMs: state.remainTurnMs,
        nStroke: state.currentSketch.strokeList.length,
        nPoints: state.currentSketch.strokeList.isEmpty
            ? 0
            : state.currentSketch.strokeList.last.length,
        strokeLength: state.currentSketch.strokeList.isEmpty
            ? 0
            : state.currentSketch.strokeList.last.strokeLength.toInt(),
        canvasSize: state.currentSketch.canvasSize,
      );

  Timer? timer;

  /// Stroke guide
  bool isStokeGuided = false;
  bool get isShowStrokeGuide {
    return state.isPlayStage &&
        state.isMyTurn &&
        state.currentRound == 0 &&
        !isStokeGuided;
  }

  bool get isReactionDisabled => config.isReactionDisabled;

  void init() {
    /// Send event
    analyticsService.sendEvent(DrawingPageExposureEvent());
    reserveRoundAnimRemoveTimer();

    /// Listen reaction stream
    listenReaction();
  }

  void listenReaction() {
    reactionSubs?.cancel();
    reactionSubs = state.reaction$Ctrl.stream.listen(playReaction);
  }

  /// Plays [sent] over the sender's face, or at the edge if it is scrolled away
  void playReaction(GameReactionSent sent) {
    final index = state.userList.indexWhere((user) => user.id == sent.userId);
    if (index < 0) return;
    reactionOverlayKey.currentState?.play(
      index: index,
      userCount: state.userList.length,
      user: state.userList[index],
      reaction: sent.reaction,
    );
  }

  void onStateChanged(GameDrawingState? oldState) {
    if (oldState?.currentTurn != state.currentTurn) {
      /// On turn changed
      scrollCtrl.scrollToIndex(
        state.currentTurn,
        preferPosition: AutoScrollPosition.middle,
      );
    }

    /// Remote round animation
    if (state.stage == GameDrawingStage.round) {
      reserveRoundAnimRemoveTimer();
    }

    /// Disconnected -> Reconnected
    if (reactionSubs == null) {
      reserveRoundAnimRemoveTimer();
      listenReaction();
    }

    switch (state.exception) {
      case GameException.channelDisconnected:
        dispose();
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

  void endTurn() {
    /// Send event
    analyticsService.sendEvent(DrawingPageEndTurnClickEvent(_eventInfo));
  }

  /// Send current sketch
  void sendCurrentSketch(Sketch sketch);

  /// Send that the last stroke is removed
  void sendUndoStroke();

  /// Remove the last stroke and give its stroke back
  void undoLastStroke() {
    /// Send event
    analyticsService.sendEvent(DrawingPageUndoClickEvent(_eventInfo));
    final strokeList = state.currentSketch.strokeList;
    if (strokeList.isEmpty) return;

    /// The server must have the stroke before it can remove it.
    _sendSketchThrottle.flush();
    final isSuccess = gameService.emit(
      state.copyWith(
        strokesLeft: state.strokesLeftAfterUndo,
        currentSketch: state.currentSketch.copyWith(
          strokeList: strokeList.sublist(0, strokeList.length - 1),
        ),
      ),
    );
    if (!isSuccess) return;
    sendUndoStroke();
  }

  void onPointerDown(Offset offset, Size canvasSize) {
    if (!isStokeGuided) isStokeGuided = true;
    if (state.noStrokesLeft) {
      Toast.showText(
        switch (state.strokesPerTurn) {
          final int n when n > 1 => S.current.gameDrawingNoStrokesLeftMulti(n),
          _ => S.current.gameDrawingNoStrokesLeft,
        },
        type: TextToastType.warning,
        builder: (child) {
          return Positioned.fill(
            child: child,
          );
        },
      );
      return;
    }
    if (!state.isDrawable) return;

    /// Send event
    analyticsService.sendEvent(DrawingPageStrokeStartEvent(_eventInfo));

    /// Stroke start
    final now = ServerTime.now;
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
        lastPointedAt: now,
        currentSketch: currentSketch,
      ),
    );

    if (isSuccess) _sendSketch();
  }

  /// The local sketch is drawn on every move; only sending it is throttled.
  void onPointerMove(Offset offset, Size canvasSize) {
    if (!state.isDrawable) return;
    if (state.currentSketch.strokeList.isEmpty) {
      onPointerDown(offset, canvasSize);
      return;
    }
    final Sketch localSketch = state.currentSketch;
    final now = ServerTime.now;
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

    /// Max stroke points limit
    final maxStrokePoints = gameService.limits.maxStrokePoints;
    if (optimizedStroke.length > maxStrokePoints) {
      Logger.d(
        "Overflow maxStrokePoints($maxStrokePoints) : ${optimizedStroke.length}",
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
    final isSuccess = gameService.emit(
      state.copyWith(
        lastPointedAt: now,
        currentSketch: nextLocalSketch,
      ),
    );
    if (isSuccess) _sendSketch();
  }

  /// Sends the latest local sketch at most once per `drawThrottleMs`
  void _sendSketch() {
    _sendSketchThrottle.run(
      gameService.limits.drawThrottleMs,
      () => sendCurrentSketch(state.currentSketch),
      trailing: true,
    );
  }

  void onPointerUp(Offset offset, Size canvasSize) async {
    /// The end of the stroke must not wait for the next window.
    _sendSketchThrottle.flush();
    if (!state.isDrawable) return;
    gameService.emit(
      state.copyWith(
        strokesLeft: state.strokesLeftAfterStroke,
      ),
    );

    /// Send event
    analyticsService.sendEvent(DrawingPageStrokeEndEvent(_eventInfo));
  }

  /// My reaction is played here, since the server does not send it back to me.
  void onReactionPressed(GameReaction reaction) {
    /// Send event
    analyticsService.sendEvent(DrawingPageReactionClickEvent(reaction));
    playReaction(GameReactionSent(userId: state.myId, reaction: reaction));
  }

  /// For test
  void testGoNext() {}

  /// For test
  void testReset() {}

  /// For test
  void testNextSection() {}

  /// For test
  void testToggleIsMafia() {}

  /// For test
  void testReactionReceived(GameReaction reaction) {}

  @override
  void dispose() {
    reactionSubs?.cancel();
    reactionSubs = null;
    timer?.cancel();
    _sendSketchThrottle.cancel();
    reactionThrottle.cancel();
    super.dispose();
  }
}
