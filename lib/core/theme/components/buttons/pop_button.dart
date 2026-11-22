import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';

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
