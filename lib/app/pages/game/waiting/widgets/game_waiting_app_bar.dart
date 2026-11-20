import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_rule_summary.dart';
import 'package:trouble_painter/app/pages/game/widgets/game_exit_button.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';

class GameRoomAppBar extends StatelessWidget {
  const GameRoomAppBar({
    super.key,
    required this.state,
    required this.onRulePressed,
  });

  final GameWaitingState state;

  /// Host only
  final void Function() onRulePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          /// Rule
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              child: GameRuleSummary(
                rule: state.rule,
                categories: state.categories,
                selectedCategories: state.selectedCategories,
                onPressed: state.isHost ? onRulePressed : null,
              ),
            ),
          ),
          const SizedBox(width: 16),

          const GameExitButton(),
        ],
      ),
    );
  }
}
