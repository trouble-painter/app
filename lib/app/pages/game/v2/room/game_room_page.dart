import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_model.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_state.dart';
import 'package:x_pr/app/pages/game/v2/room/loaded/game_room_loaded_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_failure_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_loading_page.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameRoomPage extends StatelessWidget {
  const GameRoomPage({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameRoomPageModel.new,
      state: (ref, prevState) => GameRoomInitState(),
      provider: (provider) => GameRoomPageModel.$ = provider,
      onStateChanged: (ref, viewModel, state, oldState) {
        if (state is GameRoomRoundStartedState) {
          context.pushReplacementNamed(
            Routes.gameV2Round.name,
            pathParameters: {
              'id': state.round.id,
            },
          );
        }
      },
      initState: (ref, viewModel) => viewModel.subscribeRoom(roomId),
      builder: (ref, viewModel, state) => switch (state) {
        GameRoomLoadedState() => const GameRoomLoadedPage(),
        GameRoomFailureState() => const GameFailurePage(),
        GameRoomInitState() => const GameLoadingPage(),
        GameRoomRoundStartedState() => const GameLoadingPage(),
      },
    );
  }
}
