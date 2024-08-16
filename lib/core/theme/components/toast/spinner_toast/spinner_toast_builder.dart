part of '../toast.dart';

class SpinnerToastBuilder extends StatefulWidget {
  const SpinnerToastBuilder({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
  });

  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;

  @override
  State<SpinnerToastBuilder> createState() => SpinnerToastBuilderState();
}

class SpinnerToastBuilderState extends State<SpinnerToastBuilder> {
  final animDuration = const Duration(milliseconds: 333);
  bool _isShow = false;

  void show() {
    setState(() {
      _isShow = true;
    });
  }

  Future<void> dismiss(VoidCallback callback) async {
    setState(() {
      _isShow = false;
    });
    await Future.delayed(animDuration);
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedOpacity(
          duration: animDuration,
          opacity: _isShow ? 1 : 0,

          /// Background
          child: Container(
            decoration: BoxDecoration(
              color: context.color.background,
            ),
            alignment: Alignment.center,

            /// Box
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 164,
                minHeight: 164,
                maxWidth: 600,
                maxHeight: 600,
              ),
              decoration: BoxDecoration(
                color: Palette.black,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 16,
              ),
              margin: const EdgeInsets.all(40),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: context.typo.body1.copyWith(
                  color: context.color.onToastContainer,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Spinner
                    widget.icon != null
                        ? widget.icon!
                        : const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Palette.white,
                          ),

                    /// Title
                    if (widget.text != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextBalancer(
                          widget.text!,
                          maxLines: 2,
                        ),
                      ),
                  ].gap(width: 6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
