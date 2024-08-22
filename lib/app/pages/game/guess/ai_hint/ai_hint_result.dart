import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_switcher.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/components/icons/asset_lottie.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class AiHintResult extends StatelessWidget {
  const AiHintResult({
    super.key,
    required this.aiHint,
    required this.borderRadius,
  });
  final AiHint aiHint;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimTransOpacity(
      isReverse: !aiHint.isShow,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 121,
          ),
          decoration: BoxDecoration(
            color: context.color.surface.withOpacity(0.6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 13.5),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: AssetIcon(
                      'gemini',
                      size: 18,
                    ),
                  ),
                  Text(
                    S.current.gameGuessAiHint,
                    style: context.typo.caption0,
                  ),
                ],
              ),
              Flexible(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 4,
                      right: 12,
                    ),
                    child: AnimSwitcher(
                      state: aiHint.isBusy,
                      builder: (isBusy) => isBusy
                          ? AssetLottie(
                              'loading',
                              onLoaded: (animCtrl) => animCtrl.repeat(),
                            )
                          : Text(aiHint.hint),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
