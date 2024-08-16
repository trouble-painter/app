import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class LocalDataSection extends StatelessWidget {
  const LocalDataSection({
    super.key,
    required this.title,
    this.trailingWidget,
    this.previewData,
    this.copyData,
  });

  final String title;
  final Widget? trailingWidget;
  final Object? previewData;
  final Object? copyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.color.hint,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Header
          Tile(
            title: Text(title),
            isTrailingIcon: false,
            trailing: Row(
              children: [
                if (trailingWidget != null) trailingWidget!,

                /// Copy Button
                Button(
                  type: ButtonType.flat,
                  iconWidget: (color, isInactive) => Icon(
                    Icons.copy,
                    color: color,
                  ),
                  onPressed: () async {
                    if (previewData == null) return;
                    await Clipboard.setData(
                      ClipboardData(text: jsonEncode(copyData ?? previewData)),
                    );
                    Toast.showText(S.current.copied);
                  },
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 8,
              right: 0,
              left: 16,
              bottom: 0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),

          /// Preview
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              previewData == null
                  ? ""
                  : const JsonEncoder.withIndent('  ').convert(previewData),
              style: context.typo.body1,
            ),
          ),
        ],
      ),
    );
  }
}
