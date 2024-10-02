import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/voting/widgets/game_voting_guide.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';

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
        /// Wood frame
        const Positioned(
          top: -8,
          left: 0,
          right: 0,
          child: AssetIcon(
            'wood',
            useIconColor: true,
            fit: BoxFit.fill,
          ),
        ),

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
