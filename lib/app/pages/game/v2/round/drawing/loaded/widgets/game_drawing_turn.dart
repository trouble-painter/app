import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_hovering.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameDrawingTurn extends StatelessWidget {
  const GameDrawingTurn(this.state, {super.key});

  final GameDrawingLoadedState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        children: state.round.players.asMap().entries.map((entry) {
          final turn = entry.key;
          final player = entry.value;
          final isDrawing = turn == state.drawing.turn;
          final isMe = state.player.id == player.id;
          final width = constraints.maxWidth /
              (state.players.length > 5
                  ? state.players.length ~/ 2
                  : state.players.length);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 333),
            width: width,
            decoration: BoxDecoration(
              color: isDrawing
                  ? context.color.text.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Color
                CircleAvatar(
                  backgroundColor: player.color,
                  child: isDrawing
                      ? const AnimHovering(
                          delta: 3,
                          duration: Duration(milliseconds: 1200),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                      : FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            isMe ? S.current.me : "${turn + 1}",
                            style: context.typo.caption0.copyWith(
                              color: Colors.white,
                              fontWeight: context.typo.bold,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 4),

                /// Nickname
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    player.nickname,
                    style: context.typo.caption0.copyWith(
                      fontWeight: context.typo.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
