import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.text,
    this.hint,
    this.controller,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.autoFocus = false,
    this.isSuffix = false,
    this.isBackground = true,
  });

  final String? text;
  final String? hint;
  final int? maxLength;
  final bool autoFocus;
  final bool isBackground;
  final bool isSuffix;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController(text: widget.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: controller,
      autofocus: widget.autoFocus,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      onSubmitted: widget.onSubmitted,
      style: widget.textStyle ??
          context.typo.subHeader1.copyWith(
            color: context.color.inputColor.text,
          ),
      cursorColor: context.color.primary,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        filled: widget.isBackground,
        fillColor: context.color.inputColor.background,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        hintStyle: widget.hintStyle ??
            context.typo.subHeader1.copyWith(
              fontWeight: context.typo.light,
              color: context.color.inputColor.hint,
            ),
        hintText: widget.hint != null ? " ${widget.hint}" : null,
        suffixIcon: controller.text.isEmpty || !widget.isSuffix
            ? null
            : Button(
                iconWidget: (color, isInactive) => Icon(
                  Icons.close,
                  color: color,
                ),
                type: ButtonType.flat,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                },
              ),
      ),
    );
  }
}
