import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game_model.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_mafia.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_progress.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/core/view/base_view.dart';

class MiniGame extends StatelessWidget {
  const MiniGame({
    super.key,
    required this.waitingCount,
    required this.isShowWaitingCount,
    required this.startsAt,
    required this.waitMs,
  });

  final int waitingCount;
  final bool isShowWaitingCount;
  final DateTime? startsAt;
  final int waitMs;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MiniGameModel.new,
      state: (ref, prevState) => MiniGameState(
        waitingStartedAt: DateTime.now(),
      ),
      builder: (ref, viewModel, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(width: double.infinity),

                /// Mafia
                MiniGameMafia(viewModel: viewModel),

                /// Chat bubble
                Positioned(
                  top: 10.dw,
                  left: 0.5.vw + 55.dw,
                  child: AnimTransOpacity(
                    isReverse: state.phase != MiniGamePhase.ready,
                    child: AssetImg(
                      viewModel.clickMeImg,
                      width: 80.dw,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Counter
            Text(
              S.current.gameQuickStartWaitingMiniGameClicks(state.nClick),
              style: context.typo.header3.copyWith(
                color: context.color.subtext4,
              ),
            ),

            const SizedBox(height: 21),

            /// Progress
            MiniGameProgress(
              nClick: state.nClick,
              waitingStartedAt: state.waitingStartedAt,
              startsAt: startsAt,
              waitMs: waitMs,
            ),

            const SizedBox(height: 12),

            /// Waiting count: fades in its own space, so nothing moves
            AnimTransOpacity(
              isReverse: !isShowWaitingCount,
              child: Text(
                S.current.gameQuickStartWaitingCount(waitingCount),
                style: context.typo.body1.copyWith(
                  color: context.color.subtext3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
