part of '../../app_event.dart';

sealed class GameRuleBottomSheetEvent extends AppEvent {
  const GameRuleBottomSheetEvent() : super(AppEventScreen.gameRuleBottomSheet);
}

/// Strokes per turn change
class GameRuleBottomSheetStrokesChangeEvent extends GameRuleBottomSheetEvent {
  /// Null means no limit
  final int? strokesPerTurn;

  const GameRuleBottomSheetStrokesChangeEvent(this.strokesPerTurn);

  @override
  Map<String, Object> toJson() => {
        "isUnlimited": strokesPerTurn == null,
        if (strokesPerTurn != null) "strokesPerTurn": strokesPerTurn!,
      };
}

/// Keyword language change
class GameRuleBottomSheetKeywordLanguageChangeEvent
    extends GameRuleBottomSheetEvent {
  final Language language;

  const GameRuleBottomSheetKeywordLanguageChangeEvent(this.language);

  @override
  Map<String, Object> toJson() => {"language": language.locale.languageCode};
}

/// Category chip toggle
class GameRuleBottomSheetCategoryToggleEvent extends GameRuleBottomSheetEvent {
  final String categoryId;
  final bool isSelected;

  const GameRuleBottomSheetCategoryToggleEvent({
    required this.categoryId,
    required this.isSelected,
  });

  @override
  Map<String, Object> toJson() => {
        "categoryId": categoryId,
        "isSelected": isSelected,
      };
}

/// Reset click
class GameRuleBottomSheetResetClickEvent extends GameRuleBottomSheetEvent {}

/// Confirm click
class GameRuleBottomSheetConfirmClickEvent extends GameRuleBottomSheetEvent {}
