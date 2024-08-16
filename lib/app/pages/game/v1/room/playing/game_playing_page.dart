import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/canvas/game_canvas.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/game_playing_page_model.dart';
import 'package:x_pr/app/pages/game/v1/room/playing/game_playing_page_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';

class GamePlayingPage extends StatelessWidget {
  const GamePlayingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GamePlayingPageModel.new,
      state: (ref, GamePlayingPageState? prevState) {
        Logger.d("🥹 GameService updated(prevState : $prevState)");
        final inGameState = ref.watch(GameServiceV1.$) as InGameState;
        final room = inGameState.room;
        late final GamePlayingPageState nextState;
        if (prevState == null) {
          /// Init state
          nextState = GamePlayingPageState(
            timeLeftSec: room.timeLimitSec,
            strokesLeft: room.strokeLeft,
            turnStartedAt: NetworkTime.now,
            remoteDrawingList: const [],
            inGameState: inGameState,
          );
        } else {
          final prevRoom = prevState.inGameState.room;
          final prevDrawingOrder = prevRoom.currentDrawingOrder;
          final currentDrawingOrder = room.currentDrawingOrder;
          final isTurnChanged = prevDrawingOrder != currentDrawingOrder;
          if (isTurnChanged) {
            /// Turn changed
            nextState = prevState.copyWith(
              timeLeftSec: room.timeLimitSec,
              strokesLeft: room.strokeLeft,
              localDrawing: null,
              turnStartedAt: NetworkTime.now,
              inGameState: ref.watch(GameServiceV1.$) as InGameState,
            );
          } else {
            /// Game state changed
            nextState = prevState.copyWith(
              inGameState: ref.watch(GameServiceV1.$) as InGameState,
            );
          }
        }

        /// My turn
        if (nextState.isMyTurn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Toast.showText(S.current.myTurn);
          });
        }
        return nextState;
      },
      initState: (ref, viewModel) => viewModel.subscribeDrawing(),
      builder: (ref, viewModel, state) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          viewModel.backToAssigning();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              state.room.keyword.intl,
              style: context.typo.subHeader0.copyWith(
                fontWeight: context.typo.bold,
              ),
            ),
            actions: [
              /// Reset turn
              if (ref.watch(ConfigService.$).isGameDevMode)
                Button(
                  iconWidget: (color, isInactive) => Icon(
                    Icons.refresh,
                    color: color,
                  ),
                  type: ButtonType.flat,
                  onPressed: viewModel.resetTurn,
                ),

              /// Timer
              Button(
                iconWidget: (color, isInactive) => Icon(
                  Icons.timer,
                  color: color,
                ),
                type: ButtonType.flat,
                text: "${state.timeLeftSec}",
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                /// Local Drawing
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: IgnorePointer(
                      ignoring: false,
                      // ignoring: state.strokesLeft <= 0,
                      child: LayoutBuilder(
                        builder: (context, constraints) => GameCanvas(
                          size:
                              Size(constraints.maxWidth, constraints.maxHeight),
                          brushSize: 4,
                          drawingList: state.localDrawing == null
                              ? []
                              : [state.localDrawing!],
                          onPointerDown: viewModel.onPointerDown,
                          onPointerMove: viewModel.onPointerMove,
                          onPointerUp: viewModel.onPointerUp,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Remote Drawing
                GameCanvas(
                  size: const Size(double.infinity, 300),
                  brushSize: 4,
                  drawingList: state.remoteDrawingList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
