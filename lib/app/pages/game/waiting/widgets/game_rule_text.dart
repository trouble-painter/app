import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';

/// `3획`, or `무제한` when [strokesPerTurn] is null.
String gameRuleStrokesText(int? strokesPerTurn) {
  return strokesPerTurn == null
      ? S.current.gameRuleUnlimitedStrokes
      : S.current.gameRuleStrokes(strokesPerTurn);
}

/// `모든 카테고리` when none or every one is selected,
/// the name of the only one, or `카테고리 N개`.
String gameRuleCategoriesText({
  required List<GameCategory> selected,
  required int total,
}) {
  if (selected.isEmpty || selected.length >= total) {
    return S.current.gameRuleAllCategories;
  }
  if (selected.length == 1) return selected.first.name;
  return S.current.gameRuleCategoryCount(selected.length);
}
