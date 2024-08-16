import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';

class JoinAppBar extends StatelessWidget {
  const JoinAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          PopButton(),
        ],
      ),
    );
  }
}
