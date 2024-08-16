import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/voting/game_voting_page_model.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';

class GameVotingPage extends StatelessWidget {
  const GameVotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameVotingPageModel.new,
      state: (ref, prevState) => ref.watch(GameServiceV1.$) as InGameState,
      builder: (ref, viewModel, state) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          viewModel.backToPlaying();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Voting"),
          ),
          body: const SafeArea(
            child: Text("Voting"),
          ),
        ),
      ),
    );
  }
}
