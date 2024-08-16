import 'package:flutter/material.dart';

import '../../../foundations/app_theme.dart';
import '../../icons/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.onPressed,
    this.text,
    this.icon,
    this.iconWidget,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.textWidth,
    this.padding,
    this.margin,
    this.shadow,
    ButtonType? type,
    ButtonSize? size,
    bool? disabled,
  })  : type = type ?? (text == null ? ButtonType.icon : ButtonType.fill),
        size = size ?? (text == null ? ButtonSize.small : ButtonSize.regular),
        disabled = disabled ?? false;

  /// Click event
  final void Function()? onPressed;

  /// [ButtonType] & [ButtonSize]
  final ButtonType type;
  final ButtonSize size;

  /// whether the button is disabled
  final bool disabled;

  /// Text & Icon
  final String? text;
  final String? icon;
  final Widget Function(Color color, bool isInactive)? iconWidget;

  /// Button width
  final double? width;
  final double? height;
  final double? textWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  /// Custom color
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? shadow;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  /// Whether the button is pressed
  bool isPressed = false;

  /// whether the button is disabled
  bool get isInactive => isPressed || widget.disabled;

  /// Text & Icon Color
  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );

  /// Background Color
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  /// Border
  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  /// On button pressed
  void onPressed(bool newIsPressed) {
    if (widget.onPressed == null) return;
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Click Event
      onTapUp: (details) {
        onPressed(false);
        if (!widget.disabled) {
          widget.onPressed?.call();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),

      /// Container
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(100),
          border: border,
          boxShadow: isInactive ? null : widget.shadow,
        ),
        margin: widget.margin,
        padding: widget.padding ?? widget.size.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// IconWidget
            if (widget.iconWidget != null)
              widget.iconWidget!(color, isInactive),

            /// Icon
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                size: widget.size.iconSize,
                color: color,
              ),

            /// Gap
            if ((widget.iconWidget != null || widget.icon != null) &&
                widget.text != null)
              const SizedBox(width: 8),

            /// Text
            if (widget.text != null)
              Flexible(
                child: SizedBox(
                  width: widget.textWidth,
                  child: Text(
                    widget.text!,
                    style: widget.size.getTextStyle(context).copyWith(
                          color: color,
                          fontWeight: context.typo.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
