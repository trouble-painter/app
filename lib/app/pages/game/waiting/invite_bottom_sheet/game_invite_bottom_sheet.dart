import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

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
      builder: (context, ref) {
        final isKo = ref.read(ConfigService.$).language.isKorean;
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  /// Title
                  Text(
                    S.current.gameInviteBottomSheetTitle,
                    style: context.typo.header2,
                  ),

                  const SizedBox(height: 5),

                  /// Desc
                  TextBalancer(
                    S.current.gameInviteBottomSheetDesc,
                    minLines: 2,
                    textAlign: TextAlign.center,
                    style: context.typo.body1.copyWith(
                      color: context.color.subtext4,
                    ),
                  ),

                  const SizedBox(height: 26),

                  /// Invitation Code
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.color.iconContainer,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.gameInviteBottomSheetInvitationCode,
                          style: context.typo.subHeader1,
                        ),
                        SizedBox(width: isKo ? 88 : 24),
                        Text(
                          roomId,
                          style: context.typo.subHeader1.copyWith(
                            color: context.color.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// QR
                  Container(
                    decoration: BoxDecoration(
                      color: context.color.text,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(6.37),
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 48,
                    ),
                    child: QrImageView(
                      data: qrData,
                      padding: const EdgeInsets.all(0),
                      version: QrVersions.auto,
                      size: 172,
                    ),
                  ),

                  /// Share link button
                  Button(
                    width: double.infinity,
                    size: ButtonSize.large,
                    text: S.current.gameInviteBottomSheetShareLink,
                    onPressed: onShareLinkPressed,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
