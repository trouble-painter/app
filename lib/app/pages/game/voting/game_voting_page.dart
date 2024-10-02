import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/voting/game_voting_page_model_impl.dart';
import 'package:x_pr/app/pages/game/voting/game_voting_page_model_test.dart';
import 'package:x_pr/app/pages/game/voting/widgets/game_voting_app_bar.dart';
import 'package:x_pr/app/pages/game/voting/widgets/game_voting_frame.dart';
import 'package:x_pr/app/pages/game/voting/widgets/game_voting_title.dart';
import 'package:x_pr/app/pages/game/voting/widgets/game_voting_users.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class GameVotingPage extends StatelessWidget {
  const GameVotingPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameVotingPageModelTest.new
          : GameVotingPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameVotingState,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onLongPress: viewModel.goToGuess,
              behavior: HitTestBehavior.translucent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// AppBar
                  GestureDetector(
                    onTap: viewModel.toggleIsMafia,
                    child: GameVotingAppBar(
                      maxVotingMs: state.maxVotingMs,
                      votingStartedAt: state.startedAt,
                      category: state.category,
                      keyword: state.keyword,
                      isMafia: state.isMafia,
                    ),
                  ),
                  Expanded(
                    child: AnimTransOpacity(
                      delayIndex: 0,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.color.text,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GameVotingFrame(
                          canvas: GameCanvas(
                            borderRadius: BorderRadius.circular(10),
                            sketchList: state.sketchList,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 20,
                      right: 20,
                    ),
                    child: GameVotingTitle(),
                  ),

                  /// Voting
                  GameVotingUsers(
                    animDelayIndex: 1,
                    userList: state.userList,
                    voteResult: state.voteResult,
                    myVoteIndex: state.myVoteIndex,
                    myIndex: state.myTurn,
                    onPressed: viewModel.vote,
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
