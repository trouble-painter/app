import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.builder,
    this.title,
  });

  final Widget? title;
  final Widget Function(BuildContext context, WidgetRef ref) builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: DefaultTextStyle(
                  style: context.typo.subHeader2,
                  child: title!,
                ),
              ),

            /// Child
            Consumer(
              builder: (context, ref, child) => builder(context, ref),
            ),
          ],
        ),
      ),
    );
  }
}
