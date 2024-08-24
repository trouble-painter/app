import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class TileSection extends StatelessWidget {
  const TileSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.typo.subHeader2.copyWith(
            color: context.color.subtext1,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: context.color.hintContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: children.gap(height: 4),
          ),
        ),
      ],
    );
  }
}
