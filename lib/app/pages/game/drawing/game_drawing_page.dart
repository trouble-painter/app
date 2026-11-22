import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/drawing/game_drawing_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/drawing/game_drawing_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/drawing/round/game_drawing_round.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_app_bar.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_canvas.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_easel.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_reaction.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_reaction_overlay.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_users.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/builder/child_builder.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameDrawingPage extends StatelessWidget {
  const GameDrawingPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;
  static const double userListHeight = 131;
  static const double userListPaddintTop = 21;
  static const double userListTotal = userListHeight + userListPaddintTop;

  static const double reactionHeight = 60;
  static const double reactionPaddingBottom = 12;
  static const double reactionTotal = reactionHeight + reactionPaddingBottom;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameDrawingPageModelTest.new
          : GameDrawingPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameDrawingState,
      onStateChanged: (ref, viewModel, state, oldState) {
        viewModel.onStateChanged(oldState);
      },
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        return GestureDetector(
          onTap: viewModel.testGoNext,
          onLongPress: viewModel.testReset,
          behavior: HitTestBehavior.translucent,
          child: Scaffold(
            body: ChildBuilder(
              builder: (child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SafeArea(
                      bottom: false,
                      child: child,
                    ),
                    if (state.isShowRoundAnim)
                      GameDrawingRound(
                        user: state.me,
                        isMafia: state.isMafia,
                        currentRound: state.currentRound,
                        language: ref.read(ConfigService.$).language,
                        myTurn: state.myTurn,
                        initAnimMs: state.introAnimMs,
                        roundAnimMs: state.roundAnimMs,
                        turnStartedAt: state.currentTurnStartedAt,
                      ),
                  ],
                );
              },
              child: Column(
                children: [
                  /// AppBar
                  GestureDetector(
                    onTap: viewModel.testToggleIsMafia,
                    child: GameDrawingAppBar(
                      startedAt: state.drawFrom,
                      turnMaxMs: state.turnMs,
                      startTimer: state.isPlayStage,
                    ),
                  ),

                  Expanded(
                    child: Stack(
                      children: [
                        /// Easel
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 0,
                          child: SafeArea(
                            top: false,
                            child: SizedBox(
                              height: userListTotal +
                                  (viewModel.isReactionDisabled
                                      ? 0
                                      : reactionTotal),
                              child: const GameDrawingEasel(),
                            ),
                          ),
                        ),

                        /// Gradation
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 333),
                          opacity: state.isMyTurn ? 0.2 : 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  (state.isMafia
                                          ? context.color.primary
                                          : context.color.secondary)
                                      .withValues(alpha: 0),
                                  state.isMafia
                                      ? context.color.primary
                                      : context.color.secondary,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),

                                /// Canvas & Keyword
                                child: GameDrawingCanvas(
                                  key: viewModel.canvasKey,
                                  sketchList: state.sketchList,
                                  isMafia: state.isMafia,
                                  keyword: state.keyword,
                                  isMyTurn: state.isMyTurn,
                                  category: state.category,
                                  sketch: state.currentSketch,
                                  onDone: viewModel.endTurn,
                                  onUndo: viewModel.undoLastStroke,
                                  sketchStartedAt: state.currentTurnStartedAt,
                                  onPointerDown: viewModel.onPointerDown,
                                  onPointerMove: viewModel.onPointerMove,
                                  onPointerUp: viewModel.onPointerUp,
                                  isShowStrokeGuide:
                                      viewModel.isShowStrokeGuide,
                                  maxStroke: state.strokesPerTurn,
                                  drawThrottleMs: viewModel
                                      .gameService.limits.drawThrottleMs,
                                ),
                              ),
                            ),
                            SafeArea(
                              top: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// Users
                                  Container(
                                    height: userListHeight,
                                    margin: const EdgeInsets.only(
                                      top: userListPaddintTop,
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        GameDrawingUsers(
                                          scrollController:
                                              viewModel.scrollCtrl,
                                          currentTurn: state.currentTurn,
                                          userList: state.userList,
                                          isMafia: state.isMafia,
                                          myTurn: state.myTurn,
                                          isShowCurrentTurn: state.isPlayStage,
                                        ),

                                        /// Reactions over the faces
                                        if (!viewModel.isReactionDisabled)
                                          Positioned.fill(
                                            child: GameDrawingReactionOverlay(
                                              key: viewModel.reactionOverlayKey,
                                              scrollController:
                                                  viewModel.scrollCtrl,
                                              canvasKey: viewModel.canvasKey,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  /// Reaction
                                  if (!viewModel.isReactionDisabled)
                                    Container(
                                      height: reactionHeight,
                                      margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: reactionPaddingBottom,
                                      ),
                                      child: GameDrawingReaction(
                                        onPressed: viewModel.onReactionPressed,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ].conditionalWrap(
                  builder: (child, index) => AnimTransOpacity(
                    delayIndex: index,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
