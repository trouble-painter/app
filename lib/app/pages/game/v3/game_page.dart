import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v3/drawing/game_drawing_page.dart';
import 'package:x_pr/app/pages/game/v3/game_page_model.dart';
import 'package:x_pr/app/pages/game/v3/guess/game_guess_page.dart';
import 'package:x_pr/app/pages/game/v3/ready/game_ready_page.dart';
import 'package:x_pr/app/pages/game/v3/result/game_result_page.dart';
import 'package:x_pr/app/pages/game/v3/voting/game_voting_page.dart';
import 'package:x_pr/app/pages/game/v3/waiting/game_waiting_page.dart';
import 'package:x_pr/app/pages/game/v3/widgets/game_exit_confirm_dialog.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        context.dialog(
          GameExitConfirmDialog(context),
        );
      },
      child: BaseView(
        viewModel: GamePageModel.new,
        state: (ref, prevState) => ref.watch(GameService.$),
        onStateChanged: (ref, viewModel, state, oldState) {
          if (state is GameDisconnectedState) {
            context.pop();
          }
        },
        builder: (ref, viewModel, state) => switch (state) {
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
