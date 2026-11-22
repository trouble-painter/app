import 'dart:math';
import 'dart:ui' as ui;

import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';

part 'anim_reaction_flight.dart';
part 'anim_reaction_icon.dart';
part 'anim_reaction_painter.dart';

const double _imageSize = 40;
final Random _random = Random();

/// Loaded once per icon, so a reaction starts without waiting for the SVG.
final Map<String, Future<ui.Image>> _images = {};

Future<ui.Image> _loadImage(String icon) {
  return _images.putIfAbsent(icon, () async {
    final pictureInfo = await vg.loadPicture(
      SvgAssetLoader("assets/icons/$icon.svg"),
      null,
    );
    return pictureInfo.picture.toImage(
      _imageSize.toInt(),
      _imageSize.toInt(),
    );
  });
}

/// A flight over [height] takes this long, so every height flies at the same speed.
Duration _flightDuration(double height) {
  return Duration(milliseconds: (height * 5).toInt());
}

double _randomRadianInRange() {
  final double randomDegree = -30 + _random.nextDouble() * 60;
  return randomDegree * (pi / 180);
}

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
  late final double _reactionHeight = widget.reactionHeight;
  int _index = 0;

  @override
  void dispose() {
    _iconQueue.map((icon) => icon.controller.dispose()).toList();
    super.dispose();
  }

  void _onPressed() async {
    if (widget.isReactionEnabledOnClick) {
      reaction();
    }

    widget.onPressed?.call();
  }

  void reaction() async {
    final image = await _loadImage(widget.icon);
    if (!mounted) return;
    final controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? _flightDuration(_reactionHeight),
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
