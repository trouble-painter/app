import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/canvas/game_canvas.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/voting/game_voting_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/voting/widgets/game_voting_players.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameVotingPage extends StatelessWidget {
  const GameVotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameVotingPageModel.new,
      state: (ref, prevState) {
        return ref.watch(GameRoundPageModel.$) as GameRoundLoadedState;
      },
      initState: (ref, viewModel) => viewModel
        ..startTimer()
        ..getDrawing(),
      builder: (ref, viewModel, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          title: GestureDetector(
            onTap: context.pop,
            child: Text(S.current.voteForSpy),
          ),
          actions: [
            Button(
              textWidth: 40,
              iconWidget: (color, isInactive) => Icon(
                Icons.timer,
                color: color,
              ),
              text: S.current.sec(state.round.secondsLeft),
              color: state.round.secondsLeft < 10
                  ? context.color.secondary
                  : context.color.text,
              type: ButtonType.flat,
              onPressed: viewModel.isGameDevMode ? viewModel.resetTimer : null,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// Drawing
                      GameCanvas(
                        viewModel.drawing?.sketchList ?? [],
                      ),

                      /// Category & Keywrod
                      if (!state.isSpy)
                        Positioned(
                          top: -10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.color.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "${state.round.keyword.category.intl} & ${state.round.keyword.intl}",
                                style: context.typo.subHeader0.copyWith(
                                  fontWeight: context.typo.bold,
                                  color: context.color.surface,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                /// Voting
                Expanded(
                  flex: state.round.players.length >= 7
                      ? 3
                      : state.round.players.length > 4
                          ? 2
                          : 1,
                  child: SingleChildScrollView(
                    child: IgnorePointer(
                      ignoring: state.round.secondsLeft <= 0,
                      child: GameVotingPlayers(
                        me: state.player,
                        round: state.round,
                        myTurn: state.myTurn,
                        onVoted: viewModel.onVoted,
                      ),
                    ),
                  ),
                ),

                /// Dev
                if (viewModel.isGameDevMode)
                  Row(
                    children: [
                      Button(
                        text: "←",
                        onPressed: viewModel.goToDrawing,
                      ),
                      Expanded(
                        child: Text(
                          "RoundId : ${state.round.id}\n${state.round.step}\nSPY : ${state.spy.nickname}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Button(
                        text: "→",
                        onPressed: viewModel.goToNext,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
