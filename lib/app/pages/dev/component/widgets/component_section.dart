import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class ComponentSection extends StatefulWidget {
  const ComponentSection({
    super.key,
    this.title,
    required this.children,
  });

  final String? title;
  final List<Widget> children;

  @override
  State<ComponentSection> createState() => _ComponentSectionState();
}

class _ComponentSectionState extends State<ComponentSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: context.typo.body0,
            ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: widget.children.gap(height: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
