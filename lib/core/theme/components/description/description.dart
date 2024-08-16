import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

enum DescriptionType {
  large,
  medium,
  small,
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    this.title,
    this.content,
    this.titleMaxLines = 1,
    this.type = DescriptionType.large,
  });

  final String? title;
  final int titleMaxLines;
  final List<InlineSpan>? content;
  final DescriptionType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          AutoSizeText(
            title!,
            textAlign: TextAlign.center,
            style: switch (type) {
              DescriptionType.large => context.typo.header1,
              DescriptionType.medium => context.typo.header2,
              DescriptionType.small => context.typo.subHeader1,
            },
            maxLines: titleMaxLines,
          ),
        if (content != null)
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: switch (type) {
                DescriptionType.large => context.typo.body1,
                DescriptionType.medium => context.typo.body2,
                DescriptionType.small => context.typo.body2,
              }
                  .copyWith(
                color: context.color.subtext5,
              ),
              children: content!,
            ),
          ),
      ].gap(height: 2),
    );
  }
}
