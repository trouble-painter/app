import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_keyword.dart';
import 'package:x_pr/app/pages/game/widgets/canvas/game_canvas.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
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
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                /// Remote drawing canvas
                GameCanvas(sketchList: sketchList),

                /// Local draing canvas
                GameCanvas(
                  isDrawable: isMyTurn,
                  sketchList: [sketch],
                  canvasColor: Colors.transparent,
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
                  icon: 'retry',
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
          top: isMafia ? -70 : -70,
          right: isMafia ? 48 : 48,
          left: 38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// Category & Keyword
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isMafia ? 12.49 : 16.32,
                    left: 10,
                    right: 5,
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
      ],
    );
  }
}
