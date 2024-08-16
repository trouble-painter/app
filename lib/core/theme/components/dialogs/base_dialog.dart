import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.content,
    this.action,
  });

  final Widget? title;
  final Widget? content;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            if (title != null)
              Padding(
                padding: EdgeInsets.only(
                  top: 14,
                  bottom: content != null
                      ? 0
                      : action == null
                          ? 14
                          : 28,
                ),
                child: DefaultTextStyle(
                  style: context.typo.subHeader0.copyWith(
                    color: context.color.dialogColor.title,
                  ),
                  textAlign: TextAlign.center,
                  child: title!,
                ),
              ),

            /// Content
            if (content != null)
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: title != null ? 4 : 14,
                    bottom: action == null ? 14 : 28,
                  ),
                  child: SingleChildScrollView(
                    child: DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: context.typo.body1.copyWith(
                        color: context.color.dialogColor.content,
                      ),
                      child: content!,
                    ),
                  ),
                ),
              ),

            /// Action
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
