import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/guess/widgets/game_guess_app_bar.dart';
import 'package:trouble_painter/app/pages/game/guess/widgets/game_guess_canvas.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/components/input/input.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';

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
    required this.onSubmitted,
    this.onChanged,
  });

  final bool isMafia;
  final String category;
  final String? keyword;
  final String mafiaAnswer;
  final DateTime startedAt;
  final int maxGuessMs;
  final int maxGuessLength;
  final List<Sketch> sketchList;
  final void Function(String text)? onChanged;
  final void Function(String text, {required bool isEnter}) onSubmitted;

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
              bottom: 12,
            ),
            child: GameGuessCanvas(
              isMafia: widget.isMafia,
              category: widget.category,
              keyword: widget.keyword,
              sketchList: widget.sketchList,
            ),
          ),
        ),

        /// Keyword guide
        Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: Text(
            S.current.gameGuessKeywordGuide,
            style: context.typo.caption1.copyWith(
              color: context.color.subtext2,
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
