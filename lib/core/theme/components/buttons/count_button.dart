import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    this.label,
    this.textWidth,
    required this.count,
    required this.onChanged,
    this.min,
  });

  final int count;
  final int? min;
  final double? textWidth;
  final String Function(int count)? label;
  final void Function(int count) onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      children: [
        /// Minus
        Button(
          padding: const EdgeInsets.all(8),
          type: ButtonType.outline,
          iconWidget: (color, isInactive) => Icon(
            Icons.remove,
            color: color,
          ),
          size: ButtonSize.small,
          disabled: count <= (min ?? 1),
          borderRadius: BorderRadius.circular(32),
          onPressed: () {
            onChanged(count - 1);
          },
        ),

        /// Counter
        SizedBox(
          width: textWidth,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label?.call(count) ?? '$count',
                style: context.typo.subHeader2.copyWith(
                  fontWeight: context.typo.bold,
                ),
              ),
            ),
          ),
        ),

        /// Plus
        Button(
          padding: const EdgeInsets.all(8),
          type: ButtonType.outline,
          onPressed: () => onChanged(count + 1),
          iconWidget: (color, isInactive) => Icon(
            Icons.add,
            color: color,
          ),
          size: ButtonSize.small,
          borderRadius: BorderRadius.circular(32),
        ),
      ],
    );
  }
}
