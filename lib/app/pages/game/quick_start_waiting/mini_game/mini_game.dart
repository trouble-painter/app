import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_model.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_mafia.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_progress.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';

class MiniGame extends StatelessWidget {
  const MiniGame({super.key});

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
            ),
          ],
        );
      },
    );
  }
}
