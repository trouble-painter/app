import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:x_pr/app/pages/game/v2/round/waiting/widgets/game_waiting_order_model.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_info_box.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_player_box.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';

class GameWaitingOrder extends StatelessWidget {
  const GameWaitingOrder({
    super.key,
    required this.myTurn,
    required this.drawingOrder,
  });

  final int myTurn;
  final List<GamePlayer> drawingOrder;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: GameWaitingOrderModel.new,
      state: (ref, prevState) => AutoScrollController(),
      initState: (ref, viewModel) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          viewModel.focusTo(myTurn);
        });
      },
      builder: (ref, viewModel, controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GameInfoBox(
            child: Column(
              children: [
                Text(
                  S.current.yourOrderIs(myTurn + 1),
                  style: context.typo.header1.copyWith(
                    fontWeight: context.typo.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: drawingOrder.length,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              itemBuilder: (context, index) {
                final player = drawingOrder[index];
                final isMe = myTurn == index;
                return AutoScrollTag(
                  key: ValueKey(index),
                  index: index,
                  controller: controller,
                  child: Transform.scale(
                    scale: isMe ? context.responsiveW(1.15, tablet: 1.1) : 1,
                    child: GamePlayerBox(
                      player: player,
                      margin: EdgeInsets.only(
                        bottom: isMe ? 8 : 4,
                        top: isMe ? 8 : 4,
                      ),
                      child: Stack(
                        children: [
                          Text(
                            "${index + 1}.",
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: Text(
                              player.nickname,
                              style: context.typo.subHeader1.copyWith(
                                fontWeight: context.typo.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
