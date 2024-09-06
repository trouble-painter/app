import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';

part 'anim_reaction_icon.dart';
part 'anim_reaction_painter.dart';

class AnimReaction extends StatefulWidget {
  const AnimReaction({
    super.key,
    this.reactionHeight = 200,
    this.duration,
    this.onPressed,
    this.iconList = const [],
    required this.icon,
    this.isReactionEnabledOnClick = true,
  });

  final double reactionHeight;
  final String icon;
  final Duration? duration;
  final bool isReactionEnabledOnClick;
  final VoidCallback? onPressed;
  final List<String> iconList;

  @override
  State<AnimReaction> createState() => AnimReactionState();
}

class AnimReactionState extends State<AnimReaction>
    with TickerProviderStateMixin {
  final List<AnimReactionIcon> _iconQueue = [];
  late final double _imageSize = 40;
  late final double _reactionHeight = widget.reactionHeight;
  final Random _random = Random();
  int _index = 0;

  @override
  void dispose() {
    _iconQueue.map((icon) => icon.controller.dispose()).toList();
    super.dispose();
  }

  double _randomRadianInRange() {
    final double randomDegree = -30 + _random.nextDouble() * 60;
    return randomDegree * (pi / 180);
  }

  void _onPressed() async {
    if (widget.isReactionEnabledOnClick) {
      reaction();
    }

    widget.onPressed?.call();
  }

  void reaction() async {
    final controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          Duration(
            milliseconds: (_reactionHeight * 5).toInt(),
          ),
    );
    final pictureInfo = await vg.loadPicture(
      SvgAssetLoader("assets/icons/${widget.icon}.svg"),
      null,
    );
    final image = await pictureInfo.picture.toImage(
      _imageSize.toInt(),
      _imageSize.toInt(),
    );
    setState(() {
      _iconQueue.add(
        AnimReactionIcon(
          controller: controller,
          rotation: _randomRadianInRange(),
          speed: 1,
          position: const Offset(0, 0),
          image: image,
          index: _index,
        ),
      );
      _index += 1;
    });
    controller.addStatusListener((status) {
      onStatusListener(controller, status);
    });
    controller.forward();
    HapticFeedback.mediumImpact();
  }

  void onStatusListener(
    AnimationController controller,
    AnimationStatus status,
  ) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _iconQueue.removeAt(0);
      });

      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _onPressed,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: AssetIcon(
              widget.icon,
              size: _imageSize,
              useIconColor: true,
            ),
          ),
        ),
        IgnorePointer(
          child: SizedBox(
            height: _imageSize,
            width: _imageSize,
            child: OverflowBox(
              maxHeight: _reactionHeight,
              minHeight: _reactionHeight,
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: AnimReactionPainter(
                  icons: _iconQueue,
                  repaint:
                      _iconQueue.isEmpty ? null : _iconQueue.last.controller,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
