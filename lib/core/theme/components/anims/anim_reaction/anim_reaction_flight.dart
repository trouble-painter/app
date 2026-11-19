part of 'anim_reaction.dart';

/// Flies [icon] once from the bottom center of a [height] tall box, then calls [onEnd].
class AnimReactionFlight extends StatefulWidget {
  const AnimReactionFlight({
    super.key,
    required this.icon,
    required this.height,
    this.onEnd,
  });

  static const double width = _imageSize;

  final String icon;
  final double height;
  final VoidCallback? onEnd;

  @override
  State<AnimReactionFlight> createState() => _AnimReactionFlightState();
}

class _AnimReactionFlightState extends State<AnimReactionFlight>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _flightDuration(widget.height),
  );
  AnimReactionIcon? _icon;

  @override
  void initState() {
    super.initState();
    _loadImage(widget.icon).then((image) {
      if (!mounted) return;
      setState(() {
        _icon = AnimReactionIcon(
          controller: _controller,
          rotation: _randomRadianInRange(),
          speed: 1,
          position: Offset.zero,
          image: image,
          index: _random.nextInt(2),
        );
      });
      _controller.forward().whenComplete(() => widget.onEnd?.call());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = _icon;
    return SizedBox(
      width: AnimReactionFlight.width,
      height: widget.height,
      child: icon == null
          ? null
          : CustomPaint(
              painter: AnimReactionPainter(
                icons: [icon],
                repaint: _controller,
              ),
            ),
    );
  }
}
