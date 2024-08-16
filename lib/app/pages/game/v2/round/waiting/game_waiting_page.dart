import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/waiting/game_waiting_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/waiting/widgets/game_waiting_keyword.dart';
import 'package:x_pr/app/pages/game/v2/round/waiting/widgets/game_waiting_order.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameWaitingPage extends StatelessWidget {
  const GameWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameWaitingPageModel.new,
      state: (ref, prevState) {
        return ref.watch(GameRoundPageModel.$) as GameRoundLoadedState;
      },
      initState: (ref, viewModel) => viewModel.startTimer(),
      builder: (ref, viewModel, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Button(
              textWidth: 40,
              iconWidget: (color, isInactive) => Icon(
                Icons.timer,
                color: color,
              ),
              text: S.current.sec(state.round.secondsLeft),
              type: ButtonType.flat,
              color: state.round.secondsLeft <= 5
                  ? context.color.secondary
                  : context.color.text,
              onPressed: viewModel.isGameDevMode ? viewModel.resetTimer : null,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        /// Category & Keyword
                        GameWaitingKeyword(
                          isSpy: state.isSpy,
                          keyword: state.round.keyword,
                        ),

                        const SizedBox(height: 32),

                        /// Order
                        Expanded(
                          child: GameWaitingOrder(
                            myTurn: state.myTurn,
                            drawingOrder: state.round.players,
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),

                /// Dev
                if (viewModel.isGameDevMode)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Button(
                          text: "←",
                          onPressed: context.pop,
                        ),
                        Expanded(
                          child: Text(
                            "RoundId : ${state.round.id}\nStep : ${state.round.step}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Button(
                          text: "→",
                          onPressed: viewModel.goToDrawing,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
