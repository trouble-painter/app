import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class JoinBottomSheet extends StatelessWidget {
  const JoinBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Button(
                width: double.infinity,
                text: S.current.joinBottomSheetQrScan,
                size: ButtonSize.large,
                onPressed: () {
                  context.pushReplacementNamed(Routes.joinQrPage.name);
                },
              ),
              Button(
                width: double.infinity,
                text: S.current.joinBottomSheetEnterCode,
                size: ButtonSize.large,
                onPressed: () {
                  context.pushReplacementNamed(Routes.joinPage.name);
                },
              ),
            ].gap(height: 16),
          ),
        );
      },
    );
  }
}
