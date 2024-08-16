import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class RadioTile<T> extends StatelessWidget {
  const RadioTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.value,
    required this.groupValue,
    this.padding,
    this.isTrailingIcon = false,
    this.isBackground = false,
  });

  final Widget title;
  final T value;
  final T groupValue;
  final bool isTrailingIcon;
  final bool isBackground;
  final EdgeInsetsGeometry? padding;
  final void Function(T value) onPressed;

  @override
  Widget build(BuildContext context) {
    return Tile(
      title: title,
      isBackground: true,
      onPressed: () => onPressed(value),
      trailing: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.color.onHintContainer,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: AnimatedContainer(
          width: 10,
          height: 10,
          duration: const Duration(milliseconds: 222),
          decoration: BoxDecoration(
            color: value == groupValue
                ? context.color.primary
                : context.color.hintContainer,
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
        ),
      ),
    );
  }
}
