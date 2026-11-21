import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_guide.dart';

class GameVotingFrame extends StatelessWidget {
  const GameVotingFrame({
    super.key,
    required this.canvas,
  });

  final Widget canvas;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Stack(
          fit: StackFit.expand,
          children: [
            /// Canvas
            canvas,

            /// Guide
            const GameVotingGuide(),
          ],
        ),
      ],
    );
  }
}
