import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v1/home/dialogs/edit_nickname_dialog.dart';
import 'package:x_pr/app/pages/game/v1/home/dialogs/join_game_dialog.dart';
import 'package:x_pr/app/pages/game/v1/home/game_home_page_model.dart';
import 'package:x_pr/app/pages/game/v1/home/game_home_state.dart';
import 'package:x_pr/app/pages/game/v1/home/widgets/game_guide.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_join_usecase.dart';

class GameHomePage extends StatelessWidget {
  const GameHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameHomePageModel.new,
      state: (ref, prevState) => GameHomeState(
        uid: ref.read(ConfigService.$).uuid,
        nickname: "잼미니",
      ),
      builder: (ref, viewModel, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.gameName),
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
                  EditNicknameDialog(
                    nickname: state.nickname,
                    onEdited: viewModel.onNicknameEdited,
                  ),
                  name: "gameV1EditNicknameDialog",
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Guide
                const Expanded(
                  child: Center(child: GameGuide()),
                ),

                /// Create game
                Button(
                  text: S.current.createRoom,
                  onPressed: () async {
                    switch (await viewModel.createRoom()) {
                      case Success(value: GameRoom room):
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

                const SizedBox(height: 16),

                /// Join game
                Button(
                  text: S.current.joinRoom,
                  onPressed: () async {
                    final lastestRoom = await viewModel.getLatestRoom();
                    if (!context.mounted) return;
                    context.dialog(
                      name: "gameV1JoinDialog",
                      JoinGameDialog(
                        roomId: lastestRoom?.id,
                        onEntered: (roomId) async {
                          switch (await viewModel.joinRoom(roomId)) {
                            case Success(value: GameRoom room):
                              context.pushNamed(
                                Routes.gameV2Room.name,
                                pathParameters: {'id': room.id},
                              );
                              break;
                            case Failure(e: final e):
                              if (e is GameJoinUsecaseException) {
                                Toast.showText(
                                  switch (e) {
                                    GameJoinUsecaseException.full =>
                                      S.current.roomIsFull,
                                    GameJoinUsecaseException.notFound =>
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
      ),
    );
  }
}
