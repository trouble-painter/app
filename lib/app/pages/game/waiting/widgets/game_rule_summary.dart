import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_rule_text.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';

/// The room's rule for everyone, e.g. `1획 · 모든 카테고리`.
class GameRuleSummary extends StatelessWidget {
  const GameRuleSummary({
    super.key,
    required this.rule,
    required this.categories,
    required this.selectedCategories,
  });

  final GameRule rule;
  final List<GameCategory> categories;
  final List<GameCategory> selectedCategories;

  @override
  Widget build(BuildContext context) {
    final text = [
      gameRuleStrokesText(rule.strokesPerTurn),
      gameRuleCategoriesText(
        selected: selectedCategories,
        total: categories.length,
      ),
    ].join(' · ');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: context.color.iconContainer,
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.typo.subHeader2,
        ),
      ),
    );
  }
}
