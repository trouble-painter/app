import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_impl.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_test.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/widgets/game_quick_start_waiting_app_bar.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

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
      initState: (ref, viewModel) => viewModel.init(isUiTestMode),
      builder: (ref, viewModel, state) {
        return GestureDetector(
          onLongPress: viewModel.goToReady,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  /// Pop button
                  const GameQuickStartWaitingAppBar(),

                  const SizedBox(height: 16),

                  /// Title
                  TextBalancer(
                    S.current.gameQuickStartWaitingPageTitle,
                    style: context.typo.header1,
                    textAlign: TextAlign.center,
                    minLines: 2,
                  ),

                  const SizedBox(height: 6),

                  /// Subtitle
                  Text(
                    S.current.gameQuickStartWaitingPageSubtitle,
                    style: context.typo.body1.copyWith(
                      color: context.color.subtext3,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  /// Mini game
                  const Expanded(
                    child: MiniGame(),
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
