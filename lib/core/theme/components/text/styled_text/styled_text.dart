import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final String target;
  final TextStyle style;
  final TextSpan Function(String target, TextStyle style) builder;
  final int? maxLines;
  final double? minFontSize;
  final TextOverflow? overflow;

  const StyledText(
    this.text, {
    super.key,
    required this.target,
    required this.style,
    required this.builder,
    this.maxLines,
    this.minFontSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpanList = [];
    final index = text.indexOf(target);
    if (index == -1 || target.isEmpty) {
      textSpanList.add(TextSpan(text: text, style: style));
    } else {
      final isFirst = index == 0;
      final isLast = index + target.length == text.length;
      final part1 = text.substring(0, index);
      final part2 = text.substring(index, index + target.length);
      final part3 = text.substring(index + target.length, text.length);
      final splitted = [
        if (part1.isNotEmpty) part1,
        if (part2.isNotEmpty) part2,
        if (part3.isNotEmpty) part3,
      ];

      for (int i = 0; i < splitted.length; i++) {
        final t = splitted[i];

        if (isFirst) {
          /// First
          if (i == 0) {
            textSpanList.add(builder(target, style));
          } else {
            textSpanList.add(
              TextSpan(
                text: t,
                style: style,
              ),
            );
          }
          continue;
        } else if (isLast) {
          /// Last
          if (i == splitted.length - 1) {
            textSpanList.add(builder(target, style));
          } else {
            textSpanList.add(
              TextSpan(
                text: t,
                style: style,
              ),
            );
          }
        } else {
          /// Middle
          textSpanList.add(
            TextSpan(
              text: t,
              style: style,
            ),
          );
          if (i < splitted.length - 1) {
            textSpanList.add(builder(target, style));
          }
        }
      }
    }
    return AutoSizeText.rich(
      TextSpan(
        style: style,
        children: textSpanList,
      ),
      maxLines: maxLines,
      overflow: overflow,
      minFontSize: minFontSize ?? 12,
    );
  }
}
