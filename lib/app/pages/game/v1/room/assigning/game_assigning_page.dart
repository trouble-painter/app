import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v1/room/assigning/game_assigning_page_model.dart';
import 'package:x_pr/app/pages/game/v1/room/assigning/game_assigning_page_state.dart';
import 'package:x_pr/app/pages/game/v1/room/assigning/widgets/game_assigning_keyword.dart';
import 'package:x_pr/app/pages/game/v1/room/assigning/widgets/game_assigning_order.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';

class GameAssigningPage extends StatefulWidget {
  const GameAssigningPage({
    super.key,
  });

  @override
  State<GameAssigningPage> createState() => _GameAssigningPageState();
}

class _GameAssigningPageState extends State<GameAssigningPage> {
  int count = 10;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameAssigningPageModel.new,
      initState: (ref, viewModel) {
        timer = Timer.periodic(const Duration(seconds: 1), (_) {
          if (count > 1) {
            setState(() {
              count -= 1;
            });
          } else {
            timer?.cancel();
            viewModel.goToPlaying();
          }
        });
      },
      state: (ref, prevState) {
        final inGameState = ref.watch(GameServiceV1.$) as InGameState;
        final (room, player) = (inGameState.room, inGameState.player);
        final myOrder = room.drawingOrder.indexWhere((pid) => pid == player.id);
        final drawingOrder = room.drawingOrder
            .map((pid) => room.players.firstWhere((player) => player.id == pid))
            .toList();
        return GameAssigningPageState(
          myOrder: myOrder,
          isHost: inGameState.isHost,
          isSpy: inGameState.isSpy,
          keyword: room.keyword,
          category: room.keyword.category,
          drawingOrder: drawingOrder,
        );
      },
      builder: (ref, viewModel, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) return;
            viewModel.goToWaiting();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              shadowColor: Colors.transparent,
              title: Text(
                S.current.startAfter(count),
                style: context.typo.header1.copyWith(
                  fontWeight: context.typo.bold,
                  color: context.color.secondary,
                ),
              ),
              actions: [
                if (ref.watch(ConfigService.$).isGameDevMode)
                  Button(
                    text: "Playing",
                    type: ButtonType.flat,
                    onPressed: viewModel.goToPlaying,
                  ),
              ],
            ),
            body: SafeArea(
              child: Builder(
                builder: (context) => Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),

                            /// Category & Keyword
                            GameAssigningKeyword(
                              isSpy: state.isSpy,
                              keyword: state.keyword,
                            ),

                            const SizedBox(height: 32),

                            /// Order
                            Expanded(
                              child: GameAssigningOrder(
                                myOrder: state.myOrder,
                                drawingOrder: state.drawingOrder,
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
