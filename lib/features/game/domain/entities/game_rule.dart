/// What the host of a custom room may change while waiting (`GameRule`).
class GameRule {
  /// Null means no limit.
  final int? strokesPerTurn;

  /// The categories the keyword is drawn from. Empty means all of them.
  final List<String> categoryIds;

  const GameRule({
    required this.strokesPerTurn,
    required this.categoryIds,
  });

  /// The rule a new room starts with.
  const GameRule.initial(int defaultStrokesPerTurn)
      : strokesPerTurn = defaultStrokesPerTurn,
        categoryIds = const [];

  bool isSelected(String categoryId) => categoryIds.contains(categoryId);

  GameRule copyWith({
    int? Function()? strokesPerTurn,
    List<String>? categoryIds,
  }) {
    return GameRule(
      strokesPerTurn:
          strokesPerTurn != null ? strokesPerTurn() : this.strokesPerTurn,
      categoryIds: categoryIds ?? this.categoryIds,
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
    return 'GameRule(strokesPerTurn: $strokesPerTurn, categoryIds: $categoryIds)';
  }
}
