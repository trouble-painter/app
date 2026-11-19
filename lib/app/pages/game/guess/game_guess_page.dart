import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/guess/citizen/game_guess_citizen.dart';
import 'package:trouble_painter/app/pages/game/guess/game_guess_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/guess/game_guess_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/guess/mafia/game_guess_mafia.dart';
import 'package:trouble_painter/core/theme/components/builder/child_builder.dart';
import 'package:trouble_painter/core/theme/components/input/hide_keyboard.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

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
                        isMafia: state.isMafia,
                        sketchList: state.sketchList,
                        category: state.category,
                        keyword: state.keyword,
                        mafiaAnswer: state.mafiaAnswer,
                        maxGuessLength:
                            viewModel.gameService.limits.maxAnswerLength,
                        onChanged: viewModel.onAnswerChanged,
                        onSubmitted: viewModel.submitAnswer,
                        startedAt: state.startedAt,
                        maxGuessMs: state.answerMs,
                      )
                    : GameGuessCitizen(
                        mafiaAnswer: state.mafiaAnswer,
                        sketchList: state.sketchList,
                        mafia: state.mafia,
                        isMafia: state.isMafia,
                        category: state.category,
                        keyword: state.keyword,
                        startedAt: state.startedAt,
                        maxGuessMs: state.answerMs,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
