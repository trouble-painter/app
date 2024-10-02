import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model.dart';
import 'package:x_pr/app/pages/game/result/v2/game_result_citizen_win.dart';
import 'package:x_pr/app/pages/game/result/v2/game_result_mafia_win.dart';
import 'package:x_pr/app/pages/game/result/v2/game_result_timer.dart';
import 'package:x_pr/app/pages/game/result/v2/game_result_title.dart';
import 'package:x_pr/app/pages/game/result/widgets/game_result_canvas.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

class GameResultV2 extends StatelessWidget {
  const GameResultV2({
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
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 88),

                    /// Titme
                    GameResultTitle(isMafiaWin: state.isMafiaWin),

                    const SizedBox(height: 44),

                    /// Winner
                    state.isMafiaWin
                        ? GameResultMafiaWin(
                            mafia: state.mafia,
                          )
                        : GameResultCitizenWin(
                            mafia: state.mafia,
                            mafiaAnswer: state.mafiaAnswer,
                            isKo: viewModel.config.language.isKorean,
                          ),

                    const SizedBox(height: 24),

                    /// Timer
                    GameResultTimer(
                      startedAt: state.resultStartedAt,
                      totalMs: state.showResultMs,
                      isMafiaWin: state.isMafiaWin,
                    ),

                    const SizedBox(height: 72),

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
              const Positioned(
                top: 12,
                left: 0,
                right: 16,
                child: Row(
                  children: [
                    Spacer(),
                    GameExitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
