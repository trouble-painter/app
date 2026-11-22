part of '../toast.dart';

class TextToastBuilder extends StatefulWidget {
  const TextToastBuilder({
    super.key,
    required this.text,
    required this.duration,
    required this.onDismissed,
    this.onPressed,
    this.icon,
    this.builder,
    this.isInverted = false,
  });

  final String text;
  final Widget? icon;
  final Duration duration;
  final VoidCallback onDismissed;
  final VoidCallback? onPressed;
  final Widget Function(Widget child)? builder;

  /// Surface background with text color, for toasts over a light canvas
  final bool isInverted;

  @override
  State<TextToastBuilder> createState() => TextToastBuilderState();
}

class TextToastBuilderState extends State<TextToastBuilder> {
  /// Vertical center of the app bar exit button below the safe area top:
  /// app bar padding (16) + half of the small icon button height.
  static final double _appBarButtonCenterY = 16 + ButtonSize.small.height / 2;

  final animDuration = const Duration(milliseconds: 333);
  Timer? timer;

  bool _isShow = false;
  bool get isShow => _isShow;
  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });

    if (_isShow) {
      timer = Timer(widget.duration - animDuration, () {
        isShow = false;
      });
    } else {
      timer?.cancel();
      Future.delayed(animDuration, () {
        widget.onDismissed();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isShow = true;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    return ChildBuilder(
      builder: (child) {
        final mediaQuery = MediaQuery.of(context);
        if (widget.builder != null) {
          return widget.builder!(
            SafeArea(child: child),
          );
        } else {
          return Positioned(
            top: mediaQuery.padding.top + _appBarButtonCenterY,
            left: 0,
            right: 0,
            child: FractionalTranslation(
              translation: const Offset(0, -0.5),
              child: child,
            ),
          );
        }
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Center(
          child: AnimatedOpacity(
            duration: animDuration,
            opacity: isShow ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 6,
                    sigmaY: 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isInverted
                          ? context.color.surface
                          : context.color.text.withValues(alpha: 0.6),
                      borderRadius: borderRadius,
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    padding: EdgeInsets.fromLTRB(
                      widget.icon == null ? 16 : 10,
                      8,
                      16,
                      8,
                    ),
                    child: DefaultTextStyle(
                      style: context.typo.body1.copyWith(
                        fontWeight: context.typo.typo.medium,
                        color: widget.isInverted
                            ? context.color.text
                            : context.color.surface,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.icon != null) widget.icon!,
                          Flexible(
                            child: TextBalancer(
                              widget.text,
                              textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                            ),
                          ),
                        ].gap(width: 6),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
