import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_reaction_overlay.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/utils/optimization/throttle.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/live_stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class GameDrawingPageModel extends BaseViewModel<GameDrawingState> {
  GameDrawingPageModel(super.buildState);
  final _sendSketchThrottle = Throttle();
  final reactionThrottle = Throttle();

  /// The stroke under the pen, null between strokes
  LiveStroke? _liveStroke;

  /// Kept points of [_liveStroke] the server already has. The points after them are sent again.
  int _sentKeptLength = 0;

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

  /// Send a piece of the stroke being drawn
  void sendStrokePiece(GameDrawReq piece);

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
    _liveStroke = null;
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

  /// Gap between the canvas top and the toast
  static const double _canvasToastGap = 12;

  /// Toast top that sits just inside the canvas top.
  /// The toast wraps itself in a SafeArea, so the status bar height is taken out.
  double get _canvasToastTop {
    final context = canvasKey.currentContext;
    final canvas = context?.findRenderObject();
    if (context == null || canvas is! RenderBox || !canvas.attached) {
      return _canvasToastGap;
    }
    final view = View.of(context);
    final safeTop = view.padding.top / view.devicePixelRatio;
    return canvas.localToGlobal(Offset.zero).dy - safeTop + _canvasToastGap;
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
        isInverted: true,
        builder: (child) => Positioned(
          top: _canvasToastTop,
          left: 0,
          right: 0,
          child: child,
        ),
      );
      return;
    }
    if (!state.isDrawable) return;

    /// Send event
    analyticsService.sendEvent(DrawingPageStrokeStartEvent(_eventInfo));

    /// Stroke start
    final liveStroke = LiveStroke(
      start: offset,
      startMs: _msSinceTurnStart,
      epsilon: config.drawOptimizeEpsilion,
      maxPoints: gameService.limits.maxStrokePoints,
    );
    final currentSketch = Sketch(
      userId: state.me.id,
      strokeList: [...state.currentSketch.strokeList, liveStroke.stroke],
      color: state.me.color,
      canvasSize: canvasSize,
    );
    final isSuccess = gameService.emit(
      state.copyWith(currentSketch: currentSketch),
    );
    if (!isSuccess) return;
    _liveStroke = liveStroke;
    _sentKeptLength = 0;
    _sendLiveStrokeThrottled();
  }

  /// The local sketch is drawn on every move; only sending it is throttled.
  void onPointerMove(Offset offset, Size canvasSize) {
    if (!state.isDrawable) return;
    final liveStroke = _liveStroke;
    if (liveStroke == null) {
      if (state.currentSketch.strokeList.isEmpty) {
        onPointerDown(offset, canvasSize);
      }
      return;
    }
    if (!liveStroke.add(offset, _msSinceTurnStart)) return;

    final strokes = state.currentSketch.strokeList;
    final isSuccess = gameService.emit(
      state.copyWith(
        currentSketch: state.currentSketch.copyWith(
          strokeList: [
            ...strokes.sublist(0, strokes.length - 1),
            liveStroke.stroke,
          ],
        ),
      ),
    );
    if (isSuccess) _sendLiveStrokeThrottled();
  }

  double get _msSinceTurnStart => ServerTime.now
      .difference(state.currentTurnStartedAt)
      .inMilliseconds
      .toDouble();

  /// Sends the stroke being drawn at most once per `drawThrottleMs`
  void _sendLiveStrokeThrottled() {
    _sendSketchThrottle.run(
      gameService.limits.drawThrottleMs,
      _sendLiveStroke,
      trailing: true,
    );
  }

  /// Sends the points the server does not have for good: the new kept points and the pen.
  void _sendLiveStroke() {
    final liveStroke = _liveStroke;
    if (liveStroke == null) return;
    final from = _sentKeptLength;
    if (from >= liveStroke.length) return;
    final stroke = liveStroke.stroke;
    sendStrokePiece(
      GameDrawReq(
        index: state.currentSketch.strokeList.length - 1,
        from: from,
        stroke: stroke.sublist(from, stroke.length),
        canvas: from == 0 ? state.currentSketch.canvasSize : null,
      ),
    );
    _sentKeptLength = liveStroke.keptLength;
  }

  void onPointerUp(Offset offset, Size canvasSize) async {
    /// The end of the stroke must not wait for the next window.
    _liveStroke?.finish();
    _sendSketchThrottle.cancel();
    _sendLiveStroke();
    _liveStroke = null;
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

    /// After reconnecting the server's sketch is the truth, so the stroke is not continued.
    _liveStroke = null;
    reactionThrottle.cancel();
    super.dispose();
  }
}
