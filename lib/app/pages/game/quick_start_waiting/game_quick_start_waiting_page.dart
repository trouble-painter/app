import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_impl.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_test.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameQuickStartWaitingPage extends StatelessWidget {
  const GameQuickStartWaitingPage(this.isUiTestMode, {super.key});
  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameQuickStartWaitingPageModelTest.new
          : GameQuickStartWaitingPageModelImpl.new,
      state: (ref, prevState) {
        return ref.watch(GameService.$) as GameQuickStartWaitingState;
      },
      builder: (ref, viewModel, state) {
        return GestureDetector(
          onTap: viewModel.goToReady,
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                /// Title
                Positioned(
                  bottom: context.screen.height / 2 + 92,
                  child: TextBalancer(
                    S.current.gameQuickStartWaitingPageTitle,
                    style: context.typo.header1,
                    textAlign: TextAlign.center,
                    minLines: 2,
                  ),
                ),

                /// Progress
                const Center(
                  child: SizedBox.square(
                    dimension: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                ),

                /// Desc
                Positioned(
                  top: context.screen.height / 2 + 39,
                  child: Text(
                    S.current.gameQuickStartWaitingPageDesc,
                    style: context.typo.header3.copyWith(
                      color: context.color.subtext4,
                    ),
                  ),
                ),

                /// Pop button
                const Positioned(
                  top: 12,
                  right: 16,
                  child: SafeArea(
                    child: GameExitButton(),
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
