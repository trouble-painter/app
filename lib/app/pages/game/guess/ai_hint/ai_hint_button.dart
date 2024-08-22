import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class AiHintButton extends StatefulWidget {
  const AiHintButton({
    super.key,
    required this.onPressed,
    required this.aiHintNotifier,
  });

  final ValueNotifier<AiHint> aiHintNotifier;
  final VoidCallback onPressed;

  @override
  State<AiHintButton> createState() => _AiHintButtonState();
}

class _AiHintButtonState extends State<AiHintButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animCtrl;
  bool _isPressed = false;

  bool get isPressed => _isPressed;

  set isPressed(bool value) {
    setState(() {
      _isPressed = value;
      _isPressed ? animCtrl.forward() : animCtrl.reverse();
    });
  }

  void listener() {
    isPressed = widget.aiHintNotifier.value.isShow;
  }

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 333),
    );
    widget.aiHintNotifier.addListener(listener);
  }

  @override
  void dispose() {
    widget.aiHintNotifier.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 38;
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: maxWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 333),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.color.iconContainer,
                borderRadius: BorderRadius.circular(100),
                gradient: isPressed
                    ? const LinearGradient(
                        colors: [
                          Palette.gemini00,
                          Palette.gemini25,
                          Palette.gemini50,
                          Palette.gemini72,
                          Palette.gemini100,
                        ],
                        begin: Alignment(-0.89, -0.88),
                        end: Alignment(0.89, 0.88),
                      )
                    : null,
              ),
              child: const AssetIcon(
                'gemini',
                size: 18,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedBuilder(
              animation: animCtrl,
              builder: (context, child) => DefaultTextStyle(
                style: context.typo.caption1.copyWith(
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 8),
                      const Offset(maxWidth * 2, 8),
                      [
                        ColorTween(
                          begin: context.color.text,
                          end: Palette.gemini00,
                        ).animate(animCtrl).value!,
                        ColorTween(
                          begin: context.color.text,
                          end: Palette.gemini50,
                        ).animate(animCtrl).value!,
                        ColorTween(
                          begin: context.color.text,
                          end: Palette.gemini100,
                        ).animate(animCtrl).value!,
                      ],
                      [0, 0.5, 1.0],
                    ),
                ),
                child: child!,
              ),
              child: AutoSizeText(
                S.current.gameGuessAiHint,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
