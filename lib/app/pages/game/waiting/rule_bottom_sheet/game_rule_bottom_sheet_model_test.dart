import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/game_rule_bottom_sheet_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';

class GameRuleBottomSheetModelTest extends GameRuleBottomSheetModel {
  GameRuleBottomSheetModelTest(super.buildState);

  @override
  void applyRule(GameRule rule) {
    gameService.emit(state.copyWith(rule: rule));
  }
}
