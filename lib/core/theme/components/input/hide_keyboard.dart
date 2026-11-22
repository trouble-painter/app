import 'package:material_ui/material_ui.dart';

class HideKeyboard extends StatelessWidget {
  const HideKeyboard({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
