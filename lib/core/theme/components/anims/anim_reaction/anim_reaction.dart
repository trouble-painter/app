import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

part 'anim_reaction_icon.dart';
part 'anim_reaction_painter.dart';

class AnimReaction extends StatefulWidget {
  const AnimReaction({
    super.key,
    this.width,
    this.height,
    required this.icon,
  });

  final double? width;
  final double? height;
  final String icon;

  @override
  State<AnimReaction> createState() => _AnimReactionState();
}

class _AnimReactionState extends State<AnimReaction>
    with TickerProviderStateMixin {
  final List<AnimReactionIcon> icons = [];
  late final double imageSize = widget.width ?? 40;
  final random = Random();
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  double randomRadianInRange() {
    final random = Random();
    final double randomDegree = -30 + random.nextDouble() * 60;
    return randomDegree * (pi / 180);
  }

  void onPressed() async {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    final pictureInfo = await vg.loadPicture(
      SvgAssetLoader("assets/icons/${widget.icon}.svg"),
      null,
    );
    final image = await pictureInfo.picture.toImage(
      imageSize.toInt(),
      imageSize.toInt(),
    );
    setState(() {
      icons.add(
        AnimReactionIcon(
          controller: controller,
          rotation: randomRadianInRange(),
          speed: 1,
          position: const Offset(0, 0),
          image: image,
          index: index,
        ),
      );
      index += 1;
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
        icons.removeAt(0);
      });

      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Button(
          icon: widget.icon,
          useIconColor: true,
          onPressed: onPressed,
        ),
        IgnorePointer(
          child: SizedBox(
            height: widget.height ?? 200,
            width: imageSize,
            child: CustomPaint(
              painter: AnimReactionPainter(
                icons: icons,
                repaint: icons.isEmpty ? null : icons.last.controller,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
