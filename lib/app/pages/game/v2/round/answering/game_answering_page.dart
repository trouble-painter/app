import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/answering/game_answering_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/canvas/game_canvas.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/input/input.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameAnsweringPage extends StatelessWidget {
  const GameAnsweringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameAnsweringPageModel.new,
      state: (ref, prevState) {
        return ref.watch(GameRoundPageModel.$) as GameRoundLoadedState;
      },
      initState: (ref, viewModel) => viewModel
        ..startTimer()
        ..getDrawing(),
      builder: (ref, viewModel, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          /// Timer
          title: Button(
            textWidth: 40,
            iconWidget: (color, isInactive) => Icon(
              Icons.timer,
              color: color,
            ),
            text: S.current.sec(state.round.secondsLeft),
            color: state.round.secondsLeft < 10
                ? context.color.secondary
                : context.color.text,
            type: ButtonType.flat,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          /// Title
                          Text(
                            state.isSpy
                                ? S.current.gameAnsweringSpyTitle(
                                    state.round.keyword.category.intl,
                                  )
                                : S.current.gameAnsweringCitizenTitle(
                                    state.spy.nickname,
                                  ),
                            textAlign: TextAlign.center,
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Subtitle
                          Text(
                            S.current.gameAnsweringDesc,
                            style: context.typo.body0.copyWith(
                              fontWeight: context.typo.bold,
                              color: context.color.hint,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Drawing
                Expanded(
                  child: GameCanvas(viewModel.drawing?.sketchList ?? []),
                ),
                const SizedBox(height: 16),
                IgnorePointer(
                  ignoring: !state.isSpy,
                  child: Row(
                    children: [
                      Expanded(
                        child: Input(
                          controller: viewModel.controller,
                          autoFocus: state.isSpy,
                          onChanged: viewModel.updateKeyword,
                          hint: state.isSpy
                              ? S.current.gameAnsweringSpyInputHint
                              : state.round.spyAnswer.isEmpty
                                  ? S.current.gameAnsweringCitizenInputHint(
                                      state.spy.nickname,
                                    )
                                  : state.round.spyAnswer,
                          hintStyle: state.isSpy
                              ? null
                              : context.typo.subHeader2.copyWith(
                                  fontWeight: context.typo.bold,
                                  color: context.color.text,
                                ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (state.isSpy)
                        Button(
                          text: S.current.submit,
                          onPressed: viewModel.submit,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (viewModel.isGameDevMode)
                  Text(
                    state.round.keyword.intl,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
