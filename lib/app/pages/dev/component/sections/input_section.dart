import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/input/hide_keyboard.dart';
import 'package:trouble_painter/core/theme/components/input/input.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';

class InputSection extends StatelessWidget {
  const InputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Input(
            hint: "타이틀",
            isBackground: false,
          ),
          const Input(
            hint: "타이틀",
          ),
        ].gap(height: 16),
      ),
    );
  }
}
