import 'package:flutter/material.dart';

class AnimSwitcher<T> extends StatelessWidget {
  const AnimSwitcher({
    super.key,
    required this.builder,
    required this.state,
    this.duration,
  });

  final T state;
  final Widget Function(T state) builder;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 222),
      child: builder(state),
    );
  }
}
