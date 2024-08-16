import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';

class EditNicknameAppBar extends StatelessWidget {
  const EditNicknameAppBar({super.key});

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
