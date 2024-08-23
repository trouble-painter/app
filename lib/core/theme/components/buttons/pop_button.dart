import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: "back",
      onPressed: () {
        context.pop();
        onPressed?.call();
      },
    );
  }
}
