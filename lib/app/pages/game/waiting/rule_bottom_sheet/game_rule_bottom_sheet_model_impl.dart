import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/game_rule_bottom_sheet_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';

class GameRuleBottomSheetModelImpl extends GameRuleBottomSheetModel {
  GameRuleBottomSheetModelImpl(super.buildState);

  /// Shown before the server answers, so quick taps build on each other.
  @override
  void applyRule(GameRule rule) {
    gameService.emit(state.copyWith(rule: rule));
    gameService.request(GameUpdateRuleReq(rule));
  }
}
