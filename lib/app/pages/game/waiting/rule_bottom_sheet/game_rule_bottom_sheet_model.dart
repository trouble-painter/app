import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class GameRuleBottomSheetModel
    extends BaseViewModel<GameWaitingState> {
  GameRuleBottomSheetModel(super.buildState);

  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  GameService get gameService => ref.read(GameService.$.notifier);

  /// The most strokes a rule can allow short of no limit
  int get maxStrokesPerTurn => gameService.limits.maxStrokesPerTurn;

  /// Applies [rule] at once. The server's `ROOM` replaces it afterwards.
  void applyRule(GameRule rule);

  /// [strokesPerTurn] is null for no limit.
  void changeStrokes(int? strokesPerTurn) {
    if (strokesPerTurn == state.rule.strokesPerTurn) return;

    /// Send event
    analyticsService.sendEvent(
      GameRuleBottomSheetStrokesChangeEvent(strokesPerTurn),
    );
    applyRule(state.rule.copyWith(strokesPerTurn: () => strokesPerTurn));
  }

  void toggleCategory(GameCategory category) {
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

  void onConfirmPressed() {
    /// Send event
    analyticsService.sendEvent(GameRuleBottomSheetConfirmClickEvent());
  }
}
