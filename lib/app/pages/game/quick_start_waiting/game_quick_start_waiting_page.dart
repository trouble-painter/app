import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/widgets/game_quick_start_waiting_app_bar.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
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
        final ready = state.ready;
        return GestureDetector(
          onLongPress: viewModel.goToReady,
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
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

                      /// Subtitle. Asks to get ready once a match is found.
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 333),
                        child: Text(
                          ready == null
                              ? S.current.gameQuickStartWaitingCount(
                                  state.waitingCount,
                                )
                              : S.current.gameMatchReadySubtitle,
                          key: ValueKey(ready == null),
                          style: context.typo.body1.copyWith(
                            color: ready == null
                                ? context.color.subtext3
                                : context.color.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Mini game
                      Expanded(
                        child: MiniGame(
                          ready: ready,
                        ),
                      ),
                    ],
                  ),

                  /// Ready button, floating at the bottom
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: IgnorePointer(
                      ignoring: ready == null,
                      child: AnimatedSlide(
                        duration: const Duration(milliseconds: 333),
                        curve: Curves.easeOutCubic,
                        offset:
                            ready == null ? const Offset(0, 2) : Offset.zero,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 333),
                          opacity: ready == null ? 0 : 1,
                          child: Button(
                            text: ready?.isAccepted ?? false
                                ? S.current.gameMatchAccepted
                                : S.current.gameMatchAccept,
                            width: double.infinity,
                            size: ButtonSize.large,
                            disabled: ready?.isAccepted ?? true,
                            onPressed: viewModel.accept,
                          ),
                        ),
                      ),
                    ),
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
