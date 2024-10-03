import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_model.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_click_anim.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/widgets/mini_game_click_painter.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class MiniGameMafia extends StatefulWidget {
  const MiniGameMafia({super.key, required this.viewModel});

  final MiniGameModel viewModel;

  @override
  State<MiniGameMafia> createState() => _MiniGameMafiaState();
}

class _MiniGameMafiaState extends State<MiniGameMafia>
    with TickerProviderStateMixin {
  MiniGameModel get viewModel => widget.viewModel;
  MiniGameState get state => viewModel.state;

  late final AnimationController transitionController;
  final GlobalKey painterKey = GlobalKey();
  final GlobalKey mafiaKey = GlobalKey();
  final List<MiniGameClickAnim> queue = [];
  final Random random = Random();
  bool isFinish = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    transitionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    transitionController.dispose();
    queue.map((icon) => icon.controller.dispose()).toList();
    super.dispose();
  }

  void onTapUp(TapUpDetails details) {
    if (state.phase == MiniGamePhase.finish) return;
    final Offset tapGlobal = details.globalPosition;
    final BuildContext? mafiaContext = mafiaKey.currentContext;
    final RenderBox mafia = mafiaContext?.findRenderObject() as RenderBox;

    /// Check touble area
    final mafiaGlobal = mafia.localToGlobal(Offset.zero);
    if (tapGlobal.dx < mafiaGlobal.dx) return;
    if (tapGlobal.dx > mafiaGlobal.dx + mafia.size.width) return;
    if (tapGlobal.dy < mafiaGlobal.dy) return;
    if (tapGlobal.dy > mafiaGlobal.dy + mafia.size.height) return;

    final BuildContext? canvasContext = painterKey.currentContext;
    final RenderBox canvas = canvasContext?.findRenderObject() as RenderBox;
    final Offset canvasLocal = canvas.globalToLocal(tapGlobal);
    startAnimation(canvasLocal);
    viewModel.click();

    /// Transition
    switch (state.phase) {
      case MiniGamePhase.half:
        if (transitionController.isAnimating) return;
        transitionController.repeat();
        return;
      case MiniGamePhase.finish:
        if (isFinish) return;
        isFinish = true;
        stopTransition();
        return;
      default:
        return;
    }
  }

  void stopTransition() {
    transitionController.animateTo(
      transitionController.value < 0.25
          ? 0
          : transitionController.value < 0.5
              ? 0.5
              : transitionController.value < 0.75
                  ? 0.5
                  : 1,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void startAnimation(Offset position) async {
    const duration = Duration(milliseconds: 3000);
    final animController = AnimationController(
      vsync: this,
      duration: duration,
    );
    final pictureInfo = await vg.loadPicture(
      const SvgAssetLoader("assets/icons/plus_1.svg"),
      null,
    );
    final image = await pictureInfo.picture.toImage(
      54,
      45,
    );
    setState(() {
      queue.add(
        MiniGameClickAnim(
          controller: animController,
          rotation: randomRadianInRange(),
          speed: 1,
          position: position,
          image: image,
          index: index,
        ),
      );
      index += 1;
    });
    animController.addStatusListener((status) {
      onStatusListener(animController, status);
    });
    animController.forward();
    HapticFeedback.mediumImpact();
  }

  double randomRadianInRange() {
    final double randomDegree = -30 + random.nextDouble() * 60;
    return randomDegree * (pi / 180);
  }

  void onStatusListener(
    AnimationController controller,
    AnimationStatus status,
  ) {
    if (status == AnimationStatus.completed) {
      setState(() {
        queue.removeAt(0);
      });

      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: onTapUp,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(width: double.infinity),

          /// Character
          AnimatedBuilder(
            animation: transitionController,
            builder: (context, child) {
              final amplitude =
                  context.screen.width - viewModel.mafiaWidth * 2.5;
              final x = amplitude * sin(transitionController.value * 2 * pi);
              return Transform.translate(
                offset: Offset(x, 0),
                child: child,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                /// Mafia
                AnimatedScale(
                  duration: viewModel.animDuration,
                  scale: viewModel.scale,
                  child: GestureDetector(
                    onLongPress: () {
                      if (!viewModel.config.isUiTestMode) return;
                      isFinish = false;
                      stopTransition();
                      viewModel.reset();
                    },
                    child: AssetImg(
                      key: mafiaKey,
                      'mini_game_mafia',
                      width: viewModel.mafiaWidth,
                      height: viewModel.mafiaHeight,
                    ),
                  ),
                ),

                /// Sweat
                AnimatedPositioned(
                  duration: viewModel.animDuration,
                  top: viewModel.sweat1Offset.dy,
                  left: viewModel.sweat1Offset.dx,
                  child: AnimTransOpacity(
                    isReverse: state.isBeforeHalf,
                    child: const AssetIcon(
                      'mini_game_sweat1',
                      useIconColor: true,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: viewModel.animDuration,
                  top: viewModel.sweat2Offset.dy,
                  left: viewModel.sweat2Offset.dx,
                  child: AnimTransOpacity(
                    isReverse: state.isBeforeFinish,
                    child: const AssetIcon(
                      'mini_game_sweat2',
                      useIconColor: true,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: viewModel.animDuration,
                  top: viewModel.sweat3Offset.dy,
                  left: viewModel.sweat3Offset.dx,
                  child: AnimTransOpacity(
                    isReverse: state.isBeforeFinish,
                    child: const AssetIcon(
                      'mini_game_sweat3',
                      useIconColor: true,
                    ),
                  ),
                ),

                /// Surprise
                AnimatedPositioned(
                  duration: viewModel.animDuration,
                  top: viewModel.surpriseOffset.dy,
                  left: viewModel.surpriseOffset.dx,
                  child: AnimTransOpacity(
                    isReverse: state.isBeforeFinish,
                    child: const AssetIcon(
                      'mini_game_surprise',
                      useIconColor: true,
                    ),
                  ),
                ),

                /// Sunglasses
                AnimatedPositioned(
                  duration: viewModel.sunglassesPosDuration,
                  top: viewModel.sunglassesOffset.dy,
                  left: viewModel.sunglassesOffset.dx,
                  child: AnimatedRotation(
                    duration: viewModel.sunglassesRotateDuration,
                    turns: viewModel.sunglassesRotate,
                    child: AnimatedScale(
                      duration: viewModel.animDuration,
                      scale: viewModel.scale,
                      child: IgnorePointer(
                        child: Center(
                          child: AssetImg(
                            'mini_game_sunglasses',
                            width: 81.dw,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Plus1
          CustomPaint(
            key: painterKey,
            painter: MiniGameClickPainter(
              icons: queue,
              repaint: queue.isEmpty ? null : queue.last.controller,
            ),
          ),
        ],
      ),
    );
  }
}
