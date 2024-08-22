import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/bottom_sheets/setting_bottom_sheet.dart';
import 'package:x_pr/app/pages/game/v2/lobby/dialogs/edit_nickname_dialog.dart';
import 'package:x_pr/app/pages/game/v2/lobby/dialogs/join_game_dialog.dart';
import 'package:x_pr/app/pages/game/v2/lobby/game_lobby_page_model.dart';
import 'package:x_pr/app/pages/game/v2/lobby/game_lobby_state.dart';
import 'package:x_pr/app/pages/game/v2/lobby/widgets/game_guide.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';

class GameLobbyPage extends StatelessWidget {
  const GameLobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameLobbyPageModel.new,
      state: (ref, prevState) {
        final config = ref.watch(ConfigService.$);
        return GameLobbyState(
          uuid: config.uuid,
          nickname: config.nickname,
        );
      },
      builder: (ref, viewModel, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 16,
          centerTitle: false,
          leading:

              /// Settings
              Button(
            iconWidget: (color, isInactive) => Icon(
              Icons.settings,
              color: color,
            ),
            type: ButtonType.flat,
            onPressed: () {
              context.bottomSheet(
                const SettingBottomSheet(),
                name: "gameV2SettingBottomSheet",
              );
            },
          ),
          actions: [
            /// Edit nickname
            Button(
              iconWidget: (color, isInactive) => Icon(
                Icons.edit,
                color: color,
              ),
              type: ButtonType.flat,
              text: state.nickname,
              onPressed: () {
                context.dialog(
                  name: "gameV2EditNicknameDialog",
                  EditNicknameDialog(
                    nickname: state.nickname,
                    onEdited: viewModel.onNicknameEdited,
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Guide
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: GameGuide(),
                  ),
                ),
              ),

              const Divider(),
              const SizedBox(height: 8),

              /// Create game
              Button(
                text: S.current.createRoom,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                type: ButtonType.outline,
                onPressed: () async {
                  switch (await viewModel.createRoom()) {
                    case Success(value: final room):
                      if (!context.mounted) return;
                      context.pushNamed(
                        Routes.gameV2Room.name,
                        pathParameters: {'id': room.id},
                      );
                      break;
                    case Failure():
                      Toast.showText(S.current.tryAgain);
                      break;
                    case Cancel():
                      break;
                  }
                },
              ),

              Button(
                text: S.current.joinRoom,
                type: ButtonType.outline,
                margin: const EdgeInsets.all(8),
                onPressed: () async {
                  final lastestRoom = await viewModel.getLatestRoom();
                  if (!context.mounted) return;
                  context.dialog(
                    name: "gameV2JoinDialog",
                    JoinGameDialog(
                      roomId: lastestRoom?.id,
                      onEntered: (roomId) async {
                        switch (await viewModel.joinRoom(roomId)) {
                          case Success(value: final room):
                            context.pushNamed(
                              Routes.gameV2Room.name,
                              pathParameters: {'id': room.id},
                            );
                            break;
                          case Failure(e: final e):
                            if (e is GameRoomRepositoryException) {
                              Toast.showText(
                                switch (e) {
                                  GameRoomRepositoryException.full =>
                                    S.current.roomIsFull,
                                  GameRoomRepositoryException.notFound =>
                                    S.current.roomNotFound,
                                },
                              );
                            } else {
                              Toast.showText(S.current.tryAgain);
                            }
                            break;
                          case Cancel():
                            break;
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
