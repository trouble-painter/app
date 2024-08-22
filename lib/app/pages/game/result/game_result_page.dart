import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model_impl.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model_test.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_app_bar.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_bg.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_canvas.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_card.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_character.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameResultPage extends StatelessWidget {
  const GameResultPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameResultPageModelTest.new
          : GameResultPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameResultState,
      builder: (ref, viewModel, state) {
        return Scaffold(
          body: GestureDetector(
            onTap: viewModel.changeResultType,
            child: SafeArea(
              bottom: false,
              child: Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            /// Background
                            const Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: GameResultBg(),
                            ),

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Card
                                GameResultCard(
                                  mafiaAnswer: state.mafiaAnswer,
                                  resultType: viewModel.resultType,
                                  isMafiaWin: state.isMafiaWin,
                                  isMafiaCorrect: state.isMafiaCorrect,
                                  mafia: state.mafia,
                                  onRetry: viewModel.restart,
                                  showResultMs: state.showResultMs,
                                ),

                                /// Character
                                GameResultCharacter(
                                  isMafiaWin: state.isMafiaWin,
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// Canvas
                        GameResultCanvas(
                          sketchList: state.sketchList,
                          category: state.category,
                          keyword: state.keyword,
                        ),
                      ],
                    ),
                  ),

                  /// AppBar
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: GameResultAppBar(
                      startedAt: state.resultStartedAt,
                      totalMs: state.showResultMs,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
