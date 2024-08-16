import 'package:flutter/widgets.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameInfoBox extends StatelessWidget {
  const GameInfoBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(
        top: 16,
      ),
      decoration: BoxDecoration(
        color: context.color.hint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
