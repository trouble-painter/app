import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/home/join_bottom_sheet/widgets/join_button.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class JoinBottomSheet extends StatelessWidget {
  const JoinBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 32,
            top: 36,
          ),
          child: Row(
            children: [
              Expanded(
                child: JoinButton(
                  image: 'qr',
                  text: S.current.joinBottomSheetQrScan,
                  onPressed: () {
                    context.pushReplacementNamed(Routes.joinQrPage.name);
                  },
                ),
              ),
              Expanded(
                child: JoinButton(
                  image: 'ticket',
                  text: S.current.joinBottomSheetEnterCode,
                  onPressed: () {
                    context.pushReplacementNamed(Routes.joinPage.name);
                  },
                ),
              ),
            ].gap(height: 16),
          ),
        );
      },
    );
  }
}
