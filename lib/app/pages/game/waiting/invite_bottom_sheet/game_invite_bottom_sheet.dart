import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class GameInviteBottomSheet extends StatelessWidget {
  const GameInviteBottomSheet({
    super.key,
    required this.roomId,
    required this.qrData,
    required this.onShareLinkPressed,
  });

  final String roomId;
  final String qrData;
  final Future<void> Function() onShareLinkPressed;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                /// RoomId
                Text(
                  roomId,
                  style: context.typo.header1,
                ),

                /// QR
                Container(
                  decoration: BoxDecoration(
                    color: context.color.text,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 200,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          'assets/logos/light_logo.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Share link button
                Button(
                  width: double.infinity,
                  size: ButtonSize.large,
                  text: S.current.gameInviteBottomSheetShareLink,
                  onPressed: onShareLinkPressed,
                ),
              ].gap(height: 16),
            );
          },
        ),
      ),
    );
  }
}
