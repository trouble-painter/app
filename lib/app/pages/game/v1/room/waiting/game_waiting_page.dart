import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/waiting/game_waiting_page_model.dart';
import 'package:x_pr/app/pages/game/v1/room/widgets/game_player_box.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';

class GameWaitingPage extends StatelessWidget {
  const GameWaitingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameWaitingPageModel.new,
      state: (ref, prevState) => ref.watch(GameServiceV1.$) as InGameState,
      builder: (ref, viewModel, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.players),
            actions: [
              if (ref.watch(ConfigService.$).isGameDevMode)
                Button(
                  text: "Add AI",
                  type: ButtonType.flat,
                  onPressed: viewModel.addDummyPlayer,
                ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.color.text.withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Wrap(
                        children: state.room.players.map((player) {
                          return GestureDetector(
                            onTap: () => viewModel.removePlayer(player),
                            child: GamePlayerBox(
                              width: context.screen.width * 0.5 - 48 - 2,
                              player: player,
                              margin: const EdgeInsets.all(16),
                              child: Text(
                                player.nickname,
                                style: context.typo.subHeader2.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// [Host only] Start
                  if (state.isHost)
                    Button(
                      text: S.current.gameStart,
                      width: double.infinity,
                      onPressed: viewModel.start,
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
