import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint.dart';
import 'package:x_pr/app/pages/game/guess/ai_hint/ai_hint_button.dart';
import 'package:x_pr/app/pages/game/guess/widgets/game_guess_app_bar.dart';
import 'package:x_pr/app/pages/game/guess/widgets/game_guess_canvas.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/input/input.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameGuessMafia extends StatefulWidget {
  const GameGuessMafia({
    super.key,
    required this.category,
    required this.keyword,
    required this.mafiaAnswer,
    required this.startedAt,
    required this.maxGuessMs,
    required this.maxGuessLength,
    required this.sketchList,
    required this.isMafia,
    required this.isGeminiHint,
    required this.onAiHintPressed,
    required this.aiHintNotifier,
    required this.repaintBoundaryKey,
    required this.onSubmitted,
    this.onChanged,
  });

  final bool isMafia;
  final bool isGeminiHint;
  final String category;
  final String keyword;
  final String mafiaAnswer;
  final DateTime startedAt;
  final int maxGuessMs;
  final int maxGuessLength;
  final List<Sketch> sketchList;
  final void Function(String text)? onChanged;
  final void Function(String text, {required bool isEnter}) onSubmitted;
  final ValueNotifier<AiHint> aiHintNotifier;
  final VoidCallback onAiHintPressed;
  final GlobalKey repaintBoundaryKey;

  @override
  State<GameGuessMafia> createState() => _GameGuessMafiaState();
}

class _GameGuessMafiaState extends State<GameGuessMafia> {
  late final TextEditingController controller = TextEditingController(
    text: widget.mafiaAnswer,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// AppBar
        GameGuessAppBar(
          isMafia: true,
          category: widget.category,
          startedAt: widget.startedAt,
          maxGuessMs: widget.maxGuessMs,
        ),

        /// Canvas
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 12,
              bottom: 23,
            ),
            child: GameGuessCanvas(
              aiHintNotifier: widget.aiHintNotifier,
              isMafia: widget.isMafia,
              category: widget.category,
              keyword: widget.keyword,
              sketchList: widget.sketchList,
              repaintBoundaryKey: widget.repaintBoundaryKey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 14,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Ai hint button
              if (widget.isGeminiHint) ...[
                AiHintButton(
                  aiHintNotifier: widget.aiHintNotifier,
                  onPressed: widget.onAiHintPressed,
                ),
                const SizedBox(width: 12),
              ],

              /// Input
              Expanded(
                child: Input(
                  controller: controller,
                  autoFocus: true,
                  maxLength: widget.maxGuessLength,
                  hint: S.current.gameGuessHint,
                  onChanged: widget.onChanged,
                  onSubmitted: (text) => widget.onSubmitted(
                    text,
                    isEnter: true,
                  ),
                ),
              ),

              /// Submit
              const SizedBox(width: 8),
              Button(
                text: S.current.complete,
                onPressed: () => widget.onSubmitted(
                  controller.text,
                  isEnter: false,
                ),
              ),
            ],
          ),
        ),
      ].conditionalWrap(
        builder: (child, index) => AnimTransOpacity(
          delayIndex: index,
          child: child,
        ),
      ),
    );
  }
}
