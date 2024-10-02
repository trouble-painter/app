import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model.dart';
import 'package:x_pr/app/pages/game/result/v1/game_result_app_bar.dart';
import 'package:x_pr/app/pages/game/result/v1/game_result_bg.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_canvas.dart';
import 'package:x_pr/app/pages/game/result/v1/game_result_card.dart';
import 'package:x_pr/app/pages/game/result/v1/game_result_character.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

class GameResultV1 extends StatelessWidget {
  const GameResultV1({
    super.key,
    required this.viewModel,
    required this.state,
  });

  final GameResultPageModel viewModel;
  final GameResultState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: viewModel.changeResultType,
        onLongPress: viewModel.restart,
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
  }
}
