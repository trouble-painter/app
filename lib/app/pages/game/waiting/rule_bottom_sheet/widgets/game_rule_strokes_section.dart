import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_rule_text.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

/// `1 - 2 - ... - max - unlimited` on one slider.
class GameRuleStrokesSection extends StatefulWidget {
  const GameRuleStrokesSection({
    super.key,
    required this.strokesPerTurn,
    required this.minStrokesPerTurn,
    required this.maxStrokesPerTurn,
    required this.onChanged,
  });

  /// Null means no limit
  final int? strokesPerTurn;
  final int minStrokesPerTurn;
  final int maxStrokesPerTurn;
  final void Function(int? strokesPerTurn) onChanged;

  @override
  State<GameRuleStrokesSection> createState() => _GameRuleStrokesSectionState();
}

class _GameRuleStrokesSectionState extends State<GameRuleStrokesSection> {
  /// Position while dragging; null shows [GameRuleStrokesSection.strokesPerTurn].
  int? _dragIndex;

  /// The last position stands for no limit.
  int get _unlimitedIndex =>
      widget.maxStrokesPerTurn - widget.minStrokesPerTurn + 1;

  int _indexOf(int? strokesPerTurn) {
    return strokesPerTurn == null
        ? _unlimitedIndex
        : strokesPerTurn - widget.minStrokesPerTurn;
  }

  int? _strokesAt(int index) {
    return index == _unlimitedIndex ? null : index + widget.minStrokesPerTurn;
  }

  @override
  Widget build(BuildContext context) {
    final index = _dragIndex ?? _indexOf(widget.strokesPerTurn);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title & Value
        Row(
          children: [
            Text(
              S.current.gameRuleBottomSheetStrokes,
              style: context.typo.subHeader1,
            ),
            const Spacer(),
            Text(
              gameRuleStrokesText(_strokesAt(index)),
              style: context.typo.subHeader1.copyWith(
                color: context.color.primary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),
        Text(
          S.current.gameRuleBottomSheetStrokesDesc,
          style: context.typo.caption1.copyWith(
            color: context.color.subtext5,
          ),
        ),

        const SizedBox(height: 8),

        /// Slider
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            activeTrackColor: context.color.primary,
            inactiveTrackColor: context.color.iconContainer,
            activeTickMarkColor: context.color.primary,
            inactiveTickMarkColor: context.color.iconContainer,
            thumbColor: context.color.primary,
            overlayColor: context.color.primary.withValues(alpha: 0.12),
            trackShape: const RoundedRectSliderTrackShape(),
            tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 6),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 11),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Slider(
            value: index.toDouble(),
            max: _unlimitedIndex.toDouble(),
            divisions: _unlimitedIndex,
            onChanged: (value) {
              setState(() => _dragIndex = value.round());
            },
            onChangeEnd: (value) {
              setState(() => _dragIndex = null);
              widget.onChanged(_strokesAt(value.round()));
            },
          ),
        ),
      ],
    );
  }
}
