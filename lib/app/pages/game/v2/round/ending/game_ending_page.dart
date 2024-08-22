import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/loaded/canvas/game_canvas.dart';
import 'package:x_pr/app/pages/game/v2/round/ending/game_ending_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/ending/game_ending_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/ending/widgets/game_result_banner.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';

class GameEndingPage extends StatelessWidget {
  const GameEndingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameEndingPageModel.new,
      state: (ref, prevState) => GameEndingLoadingState(),
      initState: (ref, viewModel) => viewModel
        ..init()
        ..getDrawing(),
      builder: (ref, viewModel, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Result
                Expanded(
                  flex: 2,
                  child: switch (state) {
                    GameEndingLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    SpyWinByAnsweringState(result: final result) =>
                      GameResultBanner(
                        action: S.current.spyWinByAnsweringAction(
                          result.round.keyword.intl,
                        ),
                        result: S.current.spyWinByAnsweringResult,
                      ),
                    SpyWinByVotingState(
                      result: final result,
                      mostVotedCitizen: final citizen
                    ) =>
                      GameResultBanner(
                        action: citizen != null
                            ? S.current.spyWinBySingleCitizenVoted(
                                citizen.nickname,
                              )
                            : S.current.spyWinByMultiCitizenVoted(
                                result.spy.nickname,
                              ),
                        result: S.current.spyWinByVotingResult,
                      ),
                    CitizenWinState(result: final result) => GameResultBanner(
                        action: S.current.citizenWinAction(
                          result.spy.nickname,
                          result.round.spyAnswer,
                        ),
                        result: S.current.citizenWinResult,
                      ),
                  },
                ),

                Expanded(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// Drawing
                      ValueListenableBuilder(
                        valueListenable: viewModel.drawingNotier,
                        builder: (context, drawing, child) => GameCanvas(
                          drawing?.sketchList ?? [],
                        ),
                      ),

                      /// Category & Keywrod
                      if (viewModel.keyword != null)
                        Positioned(
                          top: -10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.color.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "${viewModel.keyword!.category.intl} & ${viewModel.keyword!.intl}",
                                style: context.typo.subHeader0.copyWith(
                                  fontWeight: context.typo.bold,
                                  color: context.color.surface,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// left
                Button(
                  width: double.infinity,
                  text: S.current.left,
                  type: ButtonType.outline,
                  onPressed: context.pop,
                ),

                const SizedBox(height: 8),

                /// playAgain
                Button(
                  width: double.infinity,
                  text: S.current.playAgain,
                  type: ButtonType.outline,
                  onPressed: () async {
                    switch (await viewModel.playAgain()) {
                      case Success(value: final room):
                        context.pushReplacementNamed(
                          Routes.gameV2RoomPage.name,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
