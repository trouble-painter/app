import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/clipper/terrain_clipper.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class GameReadyBackground extends StatelessWidget {
  const GameReadyBackground({
    super.key,
    required this.isMafia,
    required this.isTerrain,
    required this.isGradient,
  });

  final bool isMafia;
  final bool isTerrain;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            /// Background linear gradient
            if (isGradient)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: context.deco.bgGradient,
                ),
              ),

            /// Terrain
            if (isTerrain)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: TerrainClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: context.color.terrain,
                  ),
                ),
              ),

            /// Character
            Positioned.fill(
              top: 62.dh,
              bottom: context.safeaAreaPadding.bottom == 0 ? 16 : 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: (isMafia ? 177 : 230.5).dw,
                  maxHeight: (isMafia ? 418.5 : 328).dh,
                ),
                child: SafeArea(
                  child: AssetImg(
                    isMafia ? 'drawing_mafia' : 'drawing_citizen',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
