import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/game_drawing_loaded_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_failure_page.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_loading_page.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameDrawingPage extends StatelessWidget {
  const GameDrawingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameDrawingPageModel.new,
      state: (ref, prevState) => GameDrawingInitState(),
      provider: (provider) => GameDrawingPageModel.$ = provider,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        return switch (state) {
          GameDrawingInitState() => const GameLoadingPage(),
          GameDrawingFailureState() => const GameFailurePage(),
          GameDrawingLoadedState() => const GameDrawingLoadedPage(),
        };
      },
    );
  }
}
