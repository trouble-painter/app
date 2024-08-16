import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/answering/game_answering_page.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page.dart';
import 'package:x_pr/app/pages/game/v2/round/ending/game_ending_page.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/voting/game_voting_page.dart';
import 'package:x_pr/app/pages/game/v2/round/waiting/game_waiting_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_failure_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_loading_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_pop_scope.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

class GameRoundPage extends StatelessWidget {
  const GameRoundPage({super.key, required this.roundId});

  final String roundId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameRoundPageModel.new,
      state: (ref, prevState) => GameRoundInitState(),
      provider: (provider) => GameRoundPageModel.$ = provider,
      initState: (ref, viewModel) => viewModel.subscribeRound(roundId),
      builder: (ref, viewModel, state) => GamePopScope(
        onPop: () {},
        child: switch (state) {
          GameRoundInitState() => const GameLoadingPage(),
          GameRoundFailureState() => const GameFailurePage(),
          GameRoundLoadedState(round: final round) => switch (round.step) {
              GameRoundStep.waiting => const GameWaitingPage(),
              GameRoundStep.drawing => const GameDrawingPage(),
              GameRoundStep.voting => const GameVotingPage(),
              GameRoundStep.answering => const GameAnsweringPage(),
              GameRoundStep.ending => const GameEndingPage(),
            },
        },
      ),
    );
  }
}
