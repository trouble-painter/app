import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_easel.dart';
import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model.dart';
import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_app_bar.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_frame.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_title.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_users.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/sketch_hit_test.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/sketch_pulse.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameVotingPage extends StatelessWidget {
  const GameVotingPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  /// Same top-only corners as the drawing and result canvases
  static const BorderRadius _canvasRadius = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  /// Votes for the player whose stroke is nearest the tap; tapping the voted one withdraws it.
  void _voteAt(
    GameVotingState state,
    GameVotingPageModel viewModel,
    Offset offset,
    Size canvasSize,
  ) {
    final userId = nearestHitUserId(
      state.sketchList,
      userIds: [for (final user in state.userList) user.id],
      tap: offset,
      canvasSize: canvasSize,
    );
    if (userId == null) return;

    viewModel.vote(
      state.userList.indexWhere((user) => user.id == userId),
      isFromCanvas: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameVotingPageModelTest.new
          : GameVotingPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameVotingState,
      initState: (ref, viewModel) => viewModel.init(),
      onStateChanged: (ref, viewModel, state, oldState) =>
          viewModel.onVotesChanged(state, oldState),
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
                      maxVotingMs: state.voteMs,
                      votingStartedAt: state.startedAt,
                      category: state.category,
                      keyword: state.keyword,
                      isMafia: state.isMafia,
                    ),
                  ),

                  /// Canvas
                  Expanded(
                    child: AnimTransOpacity(
                      delayIndex: 0,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: GameVotingFrame(
                          canvas: Stack(
                            fit: StackFit.expand,
                            children: [
                              GameCanvas(
                                borderRadius: _canvasRadius,
                                sketchList: state.sketchList,
                              ),

                              /// Strokes of the user I voted for
                              ClipRRect(
                                borderRadius: _canvasRadius,
                                child: SketchPulse(
                                  sketchList: [
                                    for (final sketch in state.sketchList)
                                      if (sketch.userId == state.myVoteUserId)
                                        sketch,
                                  ],
                                ),
                              ),

                              /// Taps, measured on the canvas itself so the size is its real one.
                              LayoutBuilder(
                                builder: (context, constraints) =>
                                    GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTapUp: (details) => _voteAt(
                                    state,
                                    viewModel,
                                    details.localPosition,
                                    constraints.biggest,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Easel with the title and players on it
                  Stack(
                    children: [
                      Positioned.fill(
                        left: 10,
                        right: 10,
                        child: GameDrawingEasel(fadeStops: [0, 0, 0.2]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 20,
                            ),
                            child: GameVotingTitle(),
                          ),

                          /// Voting
                          GameVotingUsers(
                            animDelayIndex: 1,
                            userList: state.userList,
                            topVotedUsers: state.topVotedUsers,
                            voteResult: state.voteResult,
                            myVoteIndex: state.myVoteIndex,
                            myIndex: state.myTurn,
                            isMafia: state.isMafia,
                            onPressed: viewModel.vote,
                          ),
                        ],
                      ),
                    ],
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
