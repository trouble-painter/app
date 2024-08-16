import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/assigning/game_assigning_page.dart';
import 'package:x_pr/app/pages/game/v1/room/game_room_model.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/game_playing_page.dart';
import 'package:x_pr/app/pages/game/v1/room/voting/game_voting_page.dart';
import 'package:x_pr/app/pages/game/v1/room/waiting/game_waiting_page.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';

class GameRoomPage extends StatelessWidget {
  const GameRoomPage({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameRoomModel.new,
      state: (ref, prevState) => ref.watch(GameServiceV1.$),
      initState: (ref, viewModel) => viewModel.enter(roomId),
      builder: (ref, viewModel, state) => switch (state) {
        PreGameState() => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        InGameState(room: GameRoom room) => switch (room.state) {
            GameRoomState.waiting => const GameWaitingPage(),
            GameRoomState.assigning => const GameAssigningPage(),
            GameRoomState.playing => const GamePlayingPage(),
            GameRoomState.voting => const GameVotingPage(),
          },
      },
    );
  }
}
