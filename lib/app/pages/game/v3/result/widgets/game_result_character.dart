import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';

class GameResultCharacter extends StatelessWidget {
  const GameResultCharacter({
    super.key,
    required this.isMafiaWin,
  });

  final bool isMafiaWin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 154,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: Offset(isMafiaWin ? 0 : 15, 1),
          child: AssetImg(
            isMafiaWin ? 'mafia_win' : 'mafia_lose',
            height: isMafiaWin ? 140 : 65,
          ),
        ),
      ),
    );
  }
}
