import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_keyword.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';

class GameDrawingCanvas extends StatelessWidget {
  const GameDrawingCanvas({
    super.key,
    required this.isMafia,
    required this.isMyTurn,
    required this.category,
    required this.keyword,
    required this.sketch,
    required this.sketchList,
    required this.sketchStartedAt,
    required this.onPointerDown,
    required this.onPointerMove,
    required this.onPointerUp,
    this.onDone,
    this.onClear,
  });

  final bool isMafia;
  final bool isMyTurn;
  final String category;
  final String keyword;
  final VoidCallback? onDone;
  final VoidCallback? onClear;
  final Sketch sketch;
  final List<Sketch> sketchList;
  final DateTime sketchStartedAt;
  final void Function(Offset offset, Size canvasSize) onPointerDown;
  final void Function(Offset offset, Size canvasSize) onPointerMove;
  final void Function(Offset offset, Size canvasSize) onPointerUp;
  final Color _canvasColor = Palette.white;
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        /// Canvas
        Positioned.fill(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _canvasColor,
              borderRadius: _borderRadius,
            ),
            child: Stack(
              children: [
                /// Remote drawing canvas
                GameCanvas(
                  sketchList: sketchList,
                  canvasColor: _canvasColor,
                  borderRadius: _borderRadius,
                ),

                /// Local draing canvas
                GameCanvas(
                  isDrawable: isMyTurn,
                  sketchList: [sketch],
                  canvasColor: Colors.transparent,
                  borderRadius: _borderRadius,
                  onPointerDown: onPointerDown,
                  onPointerMove: onPointerMove,
                  onPointerUp: onPointerUp,
                ),
              ],
            ),
          ),
        ),

        /// My turn controller
        Positioned(
          right: 14,
          bottom: 14,
          child: AnimTransOpacity(
            isReverse: !isMyTurn,
            child: Row(
              children: [
                Button(
                  icon: 'clear',
                  onPressed: isMyTurn ? onClear : null,
                ),
                const SizedBox(width: 12),
                Button(
                  icon: 'done',
                  onPressed: isMyTurn ? onDone : null,
                ),
              ],
            ),
          ),
        ),

        /// Hanging
        Positioned(
          top: -64,
          right: isMafia ? 56 : 48,
          left: 38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// Category & Keyword
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                    left: 10,
                    right: isMafia ? 10 : 5,
                  ),
                  child: GameDrawingKeyword(
                    category: category,
                    keyword: keyword,
                    isMafia: isMafia,
                  ),
                ),
              ),

              AssetImg(
                isMafia ? 'mafia' : 'hanging_citizen',
                width: isMafia ? 45 : 70,
              ),
            ],
          ),
        ),

        /// Clip
        const Positioned(
          top: -25,
          left: 25,
          child: AssetIcon(
            'clip',
            useIconColor: true,
          ),
        ),
      ],
    );
  }
}
