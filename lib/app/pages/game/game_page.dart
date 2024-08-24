import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/drawing/game_drawing_page.dart';
import 'package:x_pr/app/pages/game/game_page_model.dart';
import 'package:x_pr/app/pages/game/guess/game_guess_page.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page.dart';
import 'package:x_pr/app/pages/game/ready/game_ready_page.dart';
import 'package:x_pr/app/pages/game/result/game_result_page.dart';
import 'package:x_pr/app/pages/game/voting/game_voting_page.dart';
import 'package:x_pr/app/pages/game/waiting/game_waiting_page.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        context.pushNamed(Routes.gameExitDialog.name);
      },
      child: BaseView(
        viewModel: GamePageModel.new,
        state: (ref, prevState) => ref.watch(GameService.$),
        onStateChanged: (ref, viewModel, state, oldState) {
          viewModel.onStateChanged(state, oldState);
          if (state is GameDisconnectedState) {
            context.pop();
          }
        },
        initState: (ref, viewModel) => viewModel.init(),
        builder: (ref, viewModel, state) => switch (state) {
          GameQuickStartWaitingState() => GameQuickStartWaitingPage(
              viewModel.isUiTestMode,
            ),
          GameWaitingState() => GameWaitingPage(viewModel.isUiTestMode),
          GameReadyState() => GameReadyPage(viewModel.isUiTestMode),
          GameDrawingState() => GameDrawingPage(viewModel.isUiTestMode),
          GameVotingState() => GameVotingPage(viewModel.isUiTestMode),
          GameGuessState() => GameGuessPage(viewModel.isUiTestMode),
          GameResultState() => GameResultPage(viewModel.isUiTestMode),
          _ => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ),
        },
      ),
    );
  }
}
