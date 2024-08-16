import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_model.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_state.dart';
import 'package:x_pr/app/pages/game/v2/room/loaded/game_room_loaded_page_model.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_player_box.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/buttons/count_button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class GameRoomLoadedPage extends StatelessWidget {
  const GameRoomLoadedPage({
    super.key,
  });

  // final GameRoom room;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameRoomLoadedPageModel.new,
      state: (ref, prevState) {
        return ref.watch(GameRoomPageModel.$) as GameRoomLoadedState;
      },
      builder: (ref, viewModel, state) {
        final isGameDevMode = ref.read(ConfigService.$).isGameDevMode;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              S.current.players,
            ),
            actions: [
              if (isGameDevMode)
                Button(
                  iconWidget: (color, isInactive) => Icon(
                    Icons.android,
                    color: color,
                  ),
                  type: ButtonType.flat,
                  onPressed: viewModel.addDummyPlayer,
                ),

              /// Invite
              Button(
                type: ButtonType.flat,
                iconWidget: (color, isInactive) => Icon(
                  CupertinoIcons.share,
                  color: color,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: state.room.id));
                  Toast.showText(S.current.copied);
                  Share.share(S.current.inviteMessage(state.room.id));
                },
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
                      child: SingleChildScrollView(
                        child: LayoutBuilder(
                          builder: (context, constraints) => Wrap(
                            children: state.room.players.map((player) {
                              return GestureDetector(
                                onTap: () => viewModel.removePlayer(player),
                                child: GamePlayerBox(
                                  height: kToolbarHeight,
                                  width: constraints.maxWidth / 2 - (16 * 2),
                                  player: player,
                                  margin: const EdgeInsets.all(16),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      player.nickname,
                                      style: context.typo.subHeader2.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (state.isHost) ...[
                    const SizedBox(height: 16),

                    /// Drawing turn limit
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.current.turnLimit,
                            textAlign: TextAlign.center,
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                            ),
                          ),
                        ),
                        CounterButton(
                          label: (count) => "$count",
                          textWidth: 50,
                          count: state.setting.stepLimit,
                          min: 1,
                          onChanged: (stepLimit) {
                            viewModel.updateSetting(
                              state.setting.copyWith(
                                stepLimit: stepLimit,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Drawing stroke limit
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.current.drawingStrokeLimit,
                            textAlign: TextAlign.center,
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                            ),
                          ),
                        ),
                        CounterButton(
                          label: (count) => "$count",
                          textWidth: 50,
                          count: state.setting.drawingStokeLimit,
                          min: 1,
                          onChanged: (drawingStokeLimit) {
                            viewModel.updateSetting(
                              state.setting.copyWith(
                                drawingStokeLimit: drawingStokeLimit,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Drawing sec limit
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.current.drawingSecLimit,
                            textAlign: TextAlign.center,
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                            ),
                          ),
                        ),
                        CounterButton(
                          label: (count) => S.current.sec(count),
                          count: state.setting.drawingSecLimit,
                          min: 3,
                          textWidth: 50,
                          onChanged: (drawingSecLimit) {
                            viewModel.updateSetting(
                              state.setting.copyWith(
                                drawingSecLimit: drawingSecLimit,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Drawing sec limit
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.current.votingSecLimit,
                            textAlign: TextAlign.center,
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                            ),
                          ),
                        ),
                        CounterButton(
                          label: (count) => S.current.sec(count),
                          textWidth: 50,
                          count: state.setting.votingSecLimit,
                          min: 1,
                          onChanged: (votingSecLimit) {
                            viewModel.updateSetting(
                              state.setting.copyWith(
                                votingSecLimit: votingSecLimit,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],

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
