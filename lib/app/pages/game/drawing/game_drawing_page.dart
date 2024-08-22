import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/drawing/game_drawing_page_model_impl.dart';
import 'package:x_pr/app/pages/game/drawing/game_drawing_page_model_test.dart';
import 'package:x_pr/app/pages/game/drawing/round/game_drawing_round.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_app_bar.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_canvas.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_users.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameDrawingPage extends StatelessWidget {
  const GameDrawingPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

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
      initState: (ref, viewModel) => viewModel.reserveRoundAnimRemoveTimer(),
      builder: (ref, viewModel, state) {
        return GestureDetector(
          onTap: viewModel.goNext,
          onLongPress: viewModel.reset,
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
                        currentRound: state.currentRound,
                        language: ref.read(ConfigService.$).language,
                        myTurn: state.myTurn,
                        initAnimMs: state.initAnimMs,
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
                    onTap: viewModel.toggleIsMafia,
                    child: GameDrawingAppBar(
                      startedAt: state.currentTurnStartedAt.add(
                        state.currentAnimDuration,
                      ),
                      turnMaxMs: state.turnMaxMs,
                      startTimer: state.isPlayStage,
                    ),
                  ),

                  Expanded(
                    child: Stack(
                      children: [
                        /// Gradation
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 333),
                          opacity: state.isMyTurn ? 0.25 : 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  (state.isMafia
                                          ? context.color.primary
                                          : context.color.secondary)
                                      .withOpacity(0),
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
                                  bottom: 16,
                                ),

                                /// Canvas & Keyword
                                child: GameDrawingCanvas(
                                  sketchList: state.sketchList,
                                  isMafia: state.isMafia,
                                  keyword: state.keyword,
                                  isMyTurn: state.isMyTurn,
                                  category: state.category,
                                  sketch: state.currentSketch,
                                  onDone: viewModel.endTurn,
                                  onClear: viewModel.deleteSketch,
                                  sketchStartedAt: state.currentTurnStartedAt,
                                  onPointerDown: viewModel.onPointerDown,
                                  onPointerMove: viewModel.onPointerMove,
                                  onPointerUp: viewModel.onPointerUp,
                                ),
                              ),
                            ),

                            /// Users
                            SafeArea(
                              top: false,
                              child: GameDrawingUsers(
                                scrollController: viewModel.scrollController,
                                currentTurn: state.currentTurn,
                                userList: state.userList,
                                isMafia: state.isMafia,
                                myTurn: state.myTurn,
                                isShowCurrentTurn: state.isPlayStage,
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
