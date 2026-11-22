import 'package:trouble_painter/features/config/domain/entities/language.dart';

/// What the host of a custom room may change while waiting (`GameRule`).
class GameRule {
  /// Null means no limit.
  final int? strokesPerTurn;

  /// The categories the keyword is drawn from. Empty means all of them.
  final List<String> categoryIds;

  /// The language of the keywords and category names.
  final Language keywordLanguage;

  const GameRule({
    required this.strokesPerTurn,
    required this.categoryIds,
    required this.keywordLanguage,
  });

  /// The rule a new room starts with: keywords in the room's language.
  const GameRule.initial(int defaultStrokesPerTurn, Language roomLanguage)
      : strokesPerTurn = defaultStrokesPerTurn,
        categoryIds = const [],
        keywordLanguage = roomLanguage;

  bool isSelected(String categoryId) => categoryIds.contains(categoryId);

  GameRule copyWith({
    int? Function()? strokesPerTurn,
    List<String>? categoryIds,
    Language? keywordLanguage,
  }) {
    return GameRule(
      strokesPerTurn:
          strokesPerTurn != null ? strokesPerTurn() : this.strokesPerTurn,
      categoryIds: categoryIds ?? this.categoryIds,
      keywordLanguage: keywordLanguage ?? this.keywordLanguage,
    );
  }

  /// Turns [categoryId] on or off.
  GameRule toggleCategory(String categoryId) {
    return copyWith(
      categoryIds: isSelected(categoryId)
          ? categoryIds.where((id) => id != categoryId).toList()
          : [...categoryIds, categoryId],
    );
  }

  @override
  String toString() {
    return 'GameRule(strokesPerTurn: $strokesPerTurn, categoryIds: $categoryIds, keywordLanguage: $keywordLanguage)';
  }
}
