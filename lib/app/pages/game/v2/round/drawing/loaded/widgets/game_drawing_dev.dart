import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/game_drawing_loaded_page_model.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

class GameDrawingDev extends StatelessWidget {
  const GameDrawingDev({
    super.key,
    required this.state,
    required this.viewModel,
  });

  final GameDrawingLoadedState state;
  final GameDrawingLoadedPageModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Button(
                    size: ButtonSize.small,
                    text: "←",
                    onPressed: viewModel.goToWaiting,
                  ),
                  const SizedBox(height: 8),
                  Button(
                    size: ButtonSize.small,
                    text: "Clear",
                    onPressed: viewModel.deleteSketch,
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  """
${state.round.step}
drawingId : ${state.drawing.id}
isDrawable: ${state.isDrawable}""",
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Button(
                    size: ButtonSize.small,
                    text: "→",
                    onPressed: viewModel.turnOver,
                  ),
                  const SizedBox(height: 8),
                  Button(
                    size: ButtonSize.small,
                    text: "Reset",
                    onPressed: viewModel.reset,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
