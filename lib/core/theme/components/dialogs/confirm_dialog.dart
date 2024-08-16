import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/dialogs/base_dialog.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.confirmButton,
    this.action,
    this.onCancel,
    this.onConfirm,
    this.isConfirmInactive,
    this.isCancel = true,
    this.isAction = true,
  });

  final String? title;
  final String? cancelText;
  final String? confirmText;
  final Widget? action;
  final Widget? content;
  final Widget? confirmButton;
  final bool? isConfirmInactive;
  final bool isCancel;
  final bool isAction;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: title != null ? TextBalancer(title!) : null,
      content: content,
      action: isAction
          ? action ??
              Row(
                children: [
                  if (isCancel) ...[
                    /// Cancel
                    Expanded(
                      child: Button(
                        text: cancelText ?? S.current.cancel,
                        color: context.color.dialogColor.cancelButtonText,
                        backgroundColor:
                            context.color.dialogColor.cancelButtonBackground,
                        onPressed: () {
                          if (onCancel != null) {
                            onCancel?.call();
                          } else {
                            context.pop();
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: 12),
                  ],

                  /// Confirm
                  Expanded(
                    child: confirmButton ??
                        Button(
                          text: confirmText ?? S.current.confirm,
                          disabled: isConfirmInactive,
                          onPressed: () {
                            if (onConfirm != null) {
                              onConfirm?.call();
                            } else {
                              context.pop();
                            }
                          },
                        ),
                  ),
                ],
              )
          : null,
    );
  }
}
