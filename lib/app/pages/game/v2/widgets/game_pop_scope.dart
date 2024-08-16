import 'package:flutter/material.dart';

class GamePopScope extends StatelessWidget {
  const GamePopScope({
    super.key,
    required this.child,
    required this.onPop,
  });
  final Widget child;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        onPop();
      },
      child: child,
    );
  }
}
