import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/citizen/game_guess_citizen.dart';
import 'package:x_pr/app/pages/game/guess/game_guess_page_model_impl.dart';
import 'package:x_pr/app/pages/game/guess/game_guess_page_model_test.dart';
import 'package:x_pr/app/pages/game/guess/mafia/game_guess_mafia.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/components/input/hide_keyboard.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class GameGuessPage extends StatelessWidget {
  const GameGuessPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameGuessPageModelTest.new
          : GameGuessPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameGuessState,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        final config = ref.watch(ConfigService.$);
        return Scaffold(
          body: HideKeyboard(
            child: ChildBuilder(
              builder: (child) => isUiTestMode
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: viewModel.toggleIsMafia,
                      onLongPress: () => viewModel.submitAnswer(
                        "",
                        isEnter: false,
                      ),
                      child: child,
                    )
                  : child,
              child: SafeArea(
                child: state.isMafia
                    ? GameGuessMafia(
                        isGeminiHint: config.isGeminiHint,
                        aiHintNotifier: viewModel.aiHintNotifier,
                        isMafia: state.isMafia,
                        sketchList: state.sketchList,
                        category: state.category,
                        keyword: state.keyword,
                        mafiaAnswer: state.mafiaAnswer,
                        maxGuessLength: config.maxGuessLength,
                        onChanged: viewModel.onAnswerChanged,
                        onSubmitted: viewModel.submitAnswer,
                        startedAt: state.startedAt,
                        maxGuessMs: state.maxGuessMs,
                        onAiHintPressed: viewModel.onAiHintPressed,
                        repaintBoundaryKey: viewModel.repaintBoundaryKey,
                      )
                    : GameGuessCitizen(
                        aiHintNotifier: viewModel.aiHintNotifier,
                        mafiaAnswer: state.mafiaAnswer,
                        sketchList: state.sketchList,
                        mafia: state.mafia,
                        isMafia: state.isMafia,
                        category: state.category,
                        keyword: state.keyword,
                        startedAt: state.startedAt,
                        maxGuessMs: state.maxGuessMs,
                        repaintBoundaryKey: viewModel.repaintBoundaryKey,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
