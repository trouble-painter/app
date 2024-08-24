import 'package:flutter/cupertino.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.title,
    this.leadingIcon,
    this.trailing,
    this.trailingIcon,
    this.onPressed,
    this.padding,
    this.isTrailingIcon = false,
    this.isBackground = false,
  });

  final String? leadingIcon;
  final Widget title;
  final Widget? trailing;
  final Widget? trailingIcon;
  final bool isTrailingIcon;
  final bool isBackground;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 68,
        color: isBackground ? context.color.hintContainer : null,
        padding: padding ??
            const EdgeInsets.only(
              left: 20,
              right: 18,
            ),
        child: Row(
          children: [
            /// Leading
            if (leadingIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: AssetIcon(
                  leadingIcon!,
                  size: 20,
                ),
              ),

            /// Title
            Expanded(
              child: DefaultTextStyle(
                style: context.typo.subHeader1,
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                child: title,
              ),
            ),

            /// Trailing
            if (trailing != null)
              DefaultTextStyle(
                style: context.typo.body1.copyWith(
                  color: context.color.hint,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: trailing!,
                ),
              ),

            /// Trailing icon
            if (isTrailingIcon)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: trailingIcon != null
                    ? trailingIcon!
                    : Icon(
                        CupertinoIcons.chevron_forward,
                        color: context.color.hint,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
