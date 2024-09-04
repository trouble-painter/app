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
  });

  final String text;
  final Widget? icon;
  final Duration duration;
  final VoidCallback onDismissed;
  final VoidCallback? onPressed;
  final Widget Function(Widget child)? builder;

  @override
  State<TextToastBuilder> createState() => TextToastBuilderState();
}

class TextToastBuilderState extends State<TextToastBuilder> {
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
          final double safeAreaBottom = mediaQuery.padding.bottom;
          final double keyboardSize = mediaQuery.viewInsets.bottom;
          return Positioned(
            bottom: safeAreaBottom + keyboardSize + 20,
            left: 0,
            right: 0,
            child: child,
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
                      color: context.color.toastContainer.withOpacity(0.6),
                      borderRadius: borderRadius,
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                    child: DefaultTextStyle(
                      style: context.typo.body1.copyWith(
                        color: context.color.onToastContainer,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.icon != null) widget.icon!,
                          Flexible(
                            child: Text(
                              widget.text,
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
