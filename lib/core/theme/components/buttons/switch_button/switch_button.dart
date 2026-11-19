import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: context.color.primary,
      thumbColor: context.color.text,
    );
  }
}
