import 'package:flutter/cupertino.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: context.color.primary,
      thumbColor: context.color.text,
    );
  }
}
