import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_waiting_tooltip.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameWaitingButtons extends StatelessWidget {
  const GameWaitingButtons({
    super.key,
    required this.isHost,
    required this.isFull,
    required this.tooltipText,
    required this.canStart,
    required this.isReady,
    required this.onReadyPressed,
    required this.onStartPressed,
    required this.onInvitePressed,
  });

  final bool isHost;
  final bool canStart;
  final bool isFull;
  final bool isReady;
  final String tooltipText;
  final VoidCallback onReadyPressed;
  final VoidCallback onStartPressed;
  final VoidCallback onInvitePressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          /// Gradient
          Positioned(
            top: -26,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 26,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.color.surface.withValues(alpha: 0),
                    context.color.surface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          /// Buttons
          Column(
            children: [
              /// Start
              if (isHost)
                Button(
                  text: S.current.gameWaitingStart,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  disabled: !isHost || !canStart,
                  size: ButtonSize.large,
                  onPressed: onStartPressed,
                )
              else

                /// Ready
                Button(
                  text: isReady
                      ? S.current.gameWaitingReadyCancel
                      : S.current.gameWaitingReady,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  size: ButtonSize.large,
                  backgroundColor: isReady ? context.color.hintContainer : null,
                  color: isReady ? context.color.primary : null,
                  onPressed: onReadyPressed,
                ),

              Button(
                text: S.current.gameWaitingInvite,
                size: ButtonSize.large,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: 20,
                ),
                backgroundColor: context.color.hintContainer,
                color: context.color.primary,
                onPressed: onInvitePressed,
              ),
            ],
          ),

          /// Tooltip
          Positioned(
            top: -46,
            child: AnimTransOpacity(
              isReverse: !isHost || isFull,
              key: ValueKey(tooltipText),
              child: GameWaitingTooltip(
                text: tooltipText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
