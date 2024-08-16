import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';

class GamePlayerBox extends StatelessWidget {
  const GamePlayerBox({
    super.key,
    required this.player,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  final GamePlayer player;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: player.color,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin,
      alignment: Alignment.center,
      padding: padding ?? const EdgeInsets.all(16),
      child: child ??
          Text(
            player.nickname,
            style: context.typo.subHeader1.copyWith(
              color: Colors.white,
            ),
          ),
    );
  }
}
