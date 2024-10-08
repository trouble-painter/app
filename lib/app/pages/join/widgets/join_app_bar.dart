import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';

class JoinAppBar extends StatelessWidget {
  const JoinAppBar({super.key, required this.onPopPressed});

  final VoidCallback onPopPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          PopButton(
            onPressed: onPopPressed,
          ),
        ],
      ),
    );
  }
}
