part of '../toast.dart';

class CustomToastBuilder extends StatefulWidget {
  const CustomToastBuilder({
    super.key,
    required this.child,
    required this.animDuration,
    this.onPressed,
  });

  final Widget child;
  final Duration animDuration;
  final VoidCallback? onPressed;

  @override
  State<CustomToastBuilder> createState() => CustomToastBuilderState();
}

class CustomToastBuilderState extends State<CustomToastBuilder> {
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
    await Future.delayed(widget.animDuration);
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedOpacity(
          duration: widget.animDuration,
          opacity: _isShow ? 1 : 0,

          /// Background
          child: Container(
            decoration: BoxDecoration(
              color: context.color.background,
            ),
            alignment: Alignment.center,

            /// Child
            child: DefaultTextStyle(
              style: context.typo.subHeader1,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
