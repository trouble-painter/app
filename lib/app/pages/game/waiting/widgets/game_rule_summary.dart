import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_rule_text.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';

/// The room's rule for everyone, e.g. `1 · 모든 카테고리 · 한국어`.
/// Always tappable, with a brush icon.
class GameRuleSummary extends StatelessWidget {
  const GameRuleSummary({
    super.key,
    required this.rule,
    required this.categories,
    required this.selectedCategories,
    required this.onPressed,
  });

  final GameRule rule;
  final List<GameCategory> categories;
  final List<GameCategory> selectedCategories;
  final void Function() onPressed;

  static const _padding = EdgeInsets.symmetric(vertical: 10, horizontal: 14);

  @override
  Widget build(BuildContext context) {
    final text = [
      rule.strokesPerTurn?.toString() ?? S.current.gameRuleUnlimitedStrokes,
      gameRuleCategoriesText(
        selected: selectedCategories,
        total: categories.length,
      ),
      rule.keywordLanguage.nativeName,
    ].join(' · ');

    /// The content goes through [Button.iconWidget] so [AnimatedSize] sits
    /// inside the pill: outside it, the pill shrinks at once and only the
    /// growing direction looks animated.
    return LayoutBuilder(
      builder: (context, constraints) => Button(
        type: ButtonType.icon,
        padding: _padding,
        onPressed: onPressed,
        iconWidget: (color, _) => ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth - _padding.horizontal,
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 150),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.brush_rounded, size: 18, color: color),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.typo.subHeader2.copyWith(color: color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
