import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/canvas/game_canvas.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/game_drawing_loaded_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/widgets/game_drawing_dev.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/widgets/game_drawing_turn.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameDrawingLoadedPage extends StatelessWidget {
  const GameDrawingLoadedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameDrawingLoadedPageModel.new,
      state: (ref, GameDrawingLoadedState? prevState) {
        final roundState = ref.watch(GameRoundPageModel.$);
        if (prevState == null) {
          /// Init state
          final drawingState =
              ref.read(GameDrawingPageModel.$) as GameDrawingLoadedState;
          return drawingState.copyWith(
            round: roundState.round,
          );
        } else {
          /// Synchronize only rounds and synchronize drawings by subscribing.
          return prevState.copyWith(
            round: roundState.round,
          );
        }
      },
      initState: (ref, viewModel) {
        viewModel
          ..startTimer()
          ..subscribeDrawing();
      },
      builder: (ref, viewModel, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      /// Timer
                      Button(
                        textWidth: 40,
                        iconWidget: (color, isInactive) => Icon(
                          Icons.timer,
                          color: color,
                        ),
                        text: S.current.sec(max(0, state.secondsLeft)),
                        color: state.secondsLeft <= 5
                            ? context.color.secondary
                            : context.color.text,
                        type: ButtonType.flat,
                      ),

                      /// Strokes
                      Button(
                        iconWidget: (color, isInactive) => Icon(
                          Icons.brush,
                          color: color,
                        ),
                        text: "${max(0, state.strokesLeft)}",
                        type: ButtonType.flat,
                      ),
                      const Spacer(),

                      /// Delete
                      Button(
                        iconWidget: (color, isInactive) => Icon(
                          Icons.delete,
                          color: color,
                        ),
                        type: ButtonType.flat,
                        disabled: !state.isMyTurn,
                        onPressed: () {
                          viewModel.deleteSketch();
                        },
                      ),

                      /// Done
                      Button(
                        iconWidget: (color, isInactive) => Icon(
                          Icons.done,
                          color: color,
                        ),
                        type: ButtonType.flat,
                        disabled: !state.isMyTurn,
                        onPressed: () {
                          viewModel.turnOver();
                        },
                      ),
                    ],
                  ),

                  /// Category & Keyword
                  Text(
                    state.isSpy
                        ? state.round.keyword.category.intl
                        : state.round.keyword.intl,
                    style: context.typo.subHeader1.copyWith(
                      fontWeight: context.typo.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Expanded(
                    child: Stack(
                      children: [
                        /// Remote drawing canvas
                        IgnorePointer(
                          ignoring: true,
                          child: GameCanvas(state.drawing.sketchList),
                        ),

                        /// Local draing canvas
                        IgnorePointer(
                          ignoring: viewModel.isGameDevMode
                              ? false
                              : !state.isDrawable,
                          child: GameCanvas(
                            [state.localSketch],
                            canvasColor: Colors.transparent,
                            onPointerDown: viewModel.onPointerDown,
                            onPointerMove: viewModel.onPointerMove,
                            onPointerUp: viewModel.onPointerUp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      state.isMyTurn
                          ? S.current.myTurn
                          : S.current.otherPlayerTurn(
                              state.drawingPlayer.nickname,
                            ),
                      style: context.typo.subHeader2.copyWith(
                        fontWeight: context.typo.bold,
                        color: state.isMyTurn
                            ? context.color.secondary
                            : context.color.hint,
                      ),
                    ),
                  ),

                  /// Turn
                  GameDrawingTurn(state),

                  /// Dev
                  if (viewModel.isGameDevMode)
                    GameDrawingDev(
                      state: state,
                      viewModel: viewModel,
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
