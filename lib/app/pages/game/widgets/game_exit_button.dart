import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';

class GameExitButton extends StatelessWidget {
  const GameExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'go_out',
      onPressed: () {
        context.pushNamed(Routes.gameExitDialog.name);
        // context.dialog(GameExitConfirmDialog());
      },
    );
  }
}
