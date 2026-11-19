import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_canvas.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_users.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_reaction/anim_reaction.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// The side of the list a scrolled away sender is on
enum _Edge { left, right }

class _Entry {
  _Entry({
    required this.id,
    required this.reaction,
    required this.user,
    required this.faceX,
    required this.edge,
    required this.bubbleY,
  });

  final int id;
  final GameReaction reaction;
  final GameUser user;

  /// Center of the sender's face in the viewport
  final double faceX;

  /// Null while the sender's face is on screen
  final _Edge? edge;

  /// Center of the edge bubble from the top of the overlay
  final double bubbleY;
}

/// Plays reactions over [GameDrawingUsers], laid on top of it at the same size.
///
/// A reaction flies up from the sender's face. If the face is scrolled away, a bubble with
/// the reaction and the sender's nickname pops at the edge it is beyond instead.
/// The canvas height above the turn controller is split evenly among the users scrolled
/// away to that side, so each of them has a row of their own.
/// Where it shows is decided once, when it is played.
class GameDrawingReactionOverlay extends StatefulWidget {
  const GameDrawingReactionOverlay({
    super.key,
    required this.scrollController,
    required this.canvasKey,
  });

  final AutoScrollController scrollController;

  /// Key of [GameDrawingCanvas], which the edge bubbles are spread over
  final GlobalKey canvasKey;

  @override
  State<GameDrawingReactionOverlay> createState() =>
      GameDrawingReactionOverlayState();
}

class GameDrawingReactionOverlayState
    extends State<GameDrawingReactionOverlay> {
  final List<_Entry> _entries = [];
  int _nextId = 0;

  /// Plays [reaction] of [user], the [index]th of the [userCount] users.
  void play({
    required int index,
    required int userCount,
    required GameUser user,
    required GameReaction reaction,
  }) {
    final controller = widget.scrollController;
    if (!controller.hasClients) return;
    final position = controller.position;
    double faceXOf(int i) => GameDrawingUsers.faceCenterX(i) - position.pixels;
    _Edge? edgeOf(double faceX) => faceX < 0
        ? _Edge.left
        : faceX > position.viewportDimension
            ? _Edge.right
            : null;
    final faceX = faceXOf(index);
    final edge = edgeOf(faceX);
    double bubbleY = GameDrawingUsers.faceCenterY;
    final area = _bubbleArea();
    if (edge != null && area != null) {
      final rows = [
        for (int i = 0; i < userCount; i++)
          if (edgeOf(faceXOf(i)) == edge) i,
      ];
      final row = rows.indexOf(index);
      bubbleY = area.top + area.height * (row + 0.5) / rows.length;
    }
    setState(() {
      _entries.add(
        _Entry(
          id: _nextId++,
          reaction: reaction,
          user: user,
          faceX: faceX,
          edge: edge,
          bubbleY: bubbleY,
        ),
      );
    });
    HapticFeedback.mediumImpact();
  }

  /// The canvas above its turn controller, in this overlay's coordinates
  Rect? _bubbleArea() {
    final canvas = widget.canvasKey.currentContext?.findRenderObject();
    final overlay = context.findRenderObject();
    if (canvas is! RenderBox || overlay is! RenderBox) return null;
    final topLeft = overlay.globalToLocal(canvas.localToGlobal(Offset.zero));
    final rect = topLeft & canvas.size;
    return Rect.fromLTRB(
      rect.left,
      rect.top,
      rect.right,
      rect.bottom - GameDrawingCanvas.controllerAreaHeight,
    );
  }

  void _remove(_Entry entry) {
    if (!mounted) return;
    setState(() => _entries.remove(entry));
  }

  @override
  Widget build(BuildContext context) {
    final flightHeight = context.screen.height * 0.25;
    return IgnorePointer(
      child: Stack(
        clipBehavior: Clip.none,
        children: _entries.map((entry) {
          final key = ValueKey(entry.id);
          return switch (entry.edge) {
            null => Positioned(
                key: key,
                left: entry.faceX - AnimReactionFlight.width / 2,

                /// The icon starts centered on the face.
                top: GameDrawingUsers.faceCenterY +
                    AnimReactionFlight.width / 2 -
                    flightHeight,
                child: AnimReactionFlight(
                  icon: entry.reaction.name,
                  height: flightHeight,
                  onEnd: () => _remove(entry),
                ),
              ),
            final edge => Positioned(
                key: key,
                left: edge == _Edge.left ? _ReactionBubble.edgeMargin : null,
                right: edge == _Edge.right ? _ReactionBubble.edgeMargin : null,
                top: entry.bubbleY,
                child: FractionalTranslation(
                  translation: const Offset(0, -0.5),
                  child: _ReactionBubble(
                    reaction: entry.reaction,
                    nickname: entry.user.nickname,
                    edge: edge,
                    onEnd: () => _remove(entry),
                  ),
                ),
              ),
          };
        }).toList(),
      ),
    );
  }
}

/// The reaction over the nickname, pointing at [edge], popping in and fading out once
class _ReactionBubble extends StatefulWidget {
  const _ReactionBubble({
    required this.reaction,
    required this.nickname,
    required this.edge,
    required this.onEnd,
  });

  static const double edgeMargin = 4;
  static const double arrowLength = 6;
  static const double arrowWidth = 12;
  static const double iconSize = 28;
  static const double maxWidth = 72;
  static const Duration duration = Duration(milliseconds: 1600);

  final GameReaction reaction;
  final String nickname;
  final _Edge edge;
  final VoidCallback onEnd;

  @override
  State<_ReactionBubble> createState() => _ReactionBubbleState();
}

class _ReactionBubbleState extends State<_ReactionBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _ReactionBubble.duration,
  );
  late final Animation<double> _scale = Tween(begin: 0.6, end: 1.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.2, curve: Curves.easeOutBack),
    ),
  );
  late final Animation<double> _opacity = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 15),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: 55),
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
  ]).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward().whenComplete(widget.onEnd);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLeft = widget.edge == _Edge.left;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
          child: Opacity(
            opacity: _opacity.value,
            child: child,
          ),
        );
      },
      child: ClipPath(
        clipper: _SideBubbleClipper(isLeft: isLeft),
        child: Container(
          constraints: const BoxConstraints(maxWidth: _ReactionBubble.maxWidth),
          color: context.color.onHintContainer,
          padding: EdgeInsets.only(
            left: 8 + (isLeft ? _ReactionBubble.arrowLength : 0),
            right: 8 + (isLeft ? 0 : _ReactionBubble.arrowLength),
            top: 6,
            bottom: 6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AssetIcon(
                widget.reaction.name,
                size: _ReactionBubble.iconSize,
                useIconColor: true,
              ),
              const SizedBox(height: 2),
              Text(
                widget.nickname,
                style: context.typo.caption2.copyWith(
                  color: context.color.text,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A rounded box with an arrow at the middle of its left or right side
class _SideBubbleClipper extends CustomClipper<Path> {
  const _SideBubbleClipper({required this.isLeft});

  static const double radius = 12;

  final bool isLeft;

  @override
  Path getClip(Size size) {
    const arrowLength = _ReactionBubble.arrowLength;
    const arrowWidth = _ReactionBubble.arrowWidth;
    final (w, h) = (size.width, size.height);
    final body = isLeft
        ? Rect.fromLTWH(arrowLength, 0, w - arrowLength, h)
        : Rect.fromLTWH(0, 0, w - arrowLength, h);
    final (baseX, tipX) = isLeft ? (arrowLength, 0.0) : (w - arrowLength, w);
    final cy = h / 2;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(body, const Radius.circular(radius)))
      ..addPolygon(
        [
          Offset(baseX, cy - arrowWidth / 2),
          Offset(tipX, cy),
          Offset(baseX, cy + arrowWidth / 2),
        ],
        true,
      );
  }

  @override
  bool shouldReclip(_SideBubbleClipper oldClipper) =>
      oldClipper.isLeft != isLeft;
}
