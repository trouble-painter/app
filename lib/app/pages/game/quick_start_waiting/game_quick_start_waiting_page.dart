import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/widgets/game_quick_start_accept_view.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/widgets/game_quick_start_waiting_app_bar.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

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
      onStateChanged: (ref, viewModel, state, oldState) =>
          viewModel.onStateChanged(oldState),
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

                  Expanded(
                    child: switch (state.ready) {
                      final ready? => GameQuickStartAcceptView(
                          key: const ValueKey('accept'),
                          ready: ready,
                          onAcceptPressed: viewModel.accept,
                        ),
                      null => Column(
                          key: const ValueKey('waiting'),
                          children: [
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
                              S.current.gameQuickStartWaitingPageSubtitle(
                                state.minCount,
                                state.waitMs ~/ Duration.millisecondsPerSecond,
                              ),
                              style: context.typo.body1.copyWith(
                                color: context.color.subtext3,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            /// Mini game
                            Expanded(
                              child: MiniGame(
                                waitingCount: state.waitingCount,
                                isShowWaitingCount: state.isShowWaitingCount,
                                startsAt: state.startsAt,
                                waitMs: state.waitMs,
                              ),
                            ),
                          ],
                        ),
                    },
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
