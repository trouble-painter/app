import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class GameRuleBottomSheetModel
    extends BaseViewModel<GameWaitingState> {
  GameRuleBottomSheetModel(super.buildState);

  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  GameService get gameService => ref.read(GameService.$.notifier);

  /// What the host may pick, from the server
  RuleSpecView get ruleSpec => gameService.ruleSpec;

  /// Only the host changes the rule; others just look.
  bool get isEditable => state.isHost;

  /// Applies [rule] at once. The server's `ROOM` replaces it afterwards.
  void applyRule(GameRule rule);

  /// [strokesPerTurn] is null for no limit.
  void changeStrokes(int? strokesPerTurn) {
    if (!isEditable) return;
    if (strokesPerTurn == state.rule.strokesPerTurn) return;

    /// Send event
    analyticsService.sendEvent(
      GameRuleBottomSheetStrokesChangeEvent(strokesPerTurn),
    );
    applyRule(state.rule.copyWith(strokesPerTurn: () => strokesPerTurn));
  }

  void changeKeywordLanguage(Language language) {
    if (!isEditable) return;
    if (language == state.rule.keywordLanguage) return;

    /// Send event
    analyticsService.sendEvent(
      GameRuleBottomSheetKeywordLanguageChangeEvent(language),
    );
    applyRule(state.rule.copyWith(keywordLanguage: language));
  }

  void toggleCategory(GameCategory category) {
    if (!isEditable) return;
    final isSelected = state.rule.isSelected(category.id);

    /// Send event
    analyticsService.sendEvent(
      GameRuleBottomSheetCategoryToggleEvent(
        categoryId: category.id,
        isSelected: !isSelected,
      ),
    );
    applyRule(state.rule.toggleCategory(category.id));
  }

  void reset() {
    if (!isEditable) return;

    /// Send event
    analyticsService.sendEvent(GameRuleBottomSheetResetClickEvent());
    applyRule(state.initialRule);
    Toast.showText(
      S.current.gameRuleBottomSheetResetToast,
      builder: (child) => Positioned(
        top: 64,
        left: 0,
        right: 0,
        child: child,
      ),
    );
  }

  void onClosePressed() {
    /// Send event
    analyticsService.sendEvent(GameRuleBottomSheetCloseClickEvent());
  }

  /// A non-host tried to change the rule.
  void onNotHostPressed() {
    /// Send event
    analyticsService.sendEvent(GameRuleBottomSheetNotHostClickEvent());
    Toast.showText(
      S.current.gameRuleHostOnlyToast,
      builder: (child) => Positioned(
        top: 64,
        left: 0,
        right: 0,
        child: child,
      ),
    );
  }

  void onConfirmPressed() {
    /// Send event
    analyticsService.sendEvent(GameRuleBottomSheetConfirmClickEvent());
  }
}
