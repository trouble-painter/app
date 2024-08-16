import 'package:flutter/material.dart';

class ChildBuilder extends StatelessWidget {
  const ChildBuilder({
    super.key,
    required this.child,
    required this.builder,
  });

  final Widget child;
  final Widget Function(Widget child) builder;

  @override
  Widget build(BuildContext context) {
    return builder(child);
  }
}
