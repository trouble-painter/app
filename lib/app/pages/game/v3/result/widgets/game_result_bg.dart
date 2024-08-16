import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class GameResultBg extends StatelessWidget {
  const GameResultBg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Stack(
        children: [
          /// Background
          AssetImg(
            'result_bg',
            width: context.screen.width,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),

          /// Gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.color.surface,
                    context.color.surface.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.1, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
