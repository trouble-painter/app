import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class GameInviteBottomSheet extends StatelessWidget {
  const GameInviteBottomSheet({
    super.key,
    required this.roomId,
    required this.qrData,
    required this.onShareLinkPressed,
    required this.onClosePressed,
  });

  final String roomId;
  final String qrData;
  final Future<void> Function() onShareLinkPressed;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Consumer(
        builder: (context, ref, child) {
          final isKo = ref.read(ConfigService.$).language.isKorean;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 16,
                  left: 20,
                  right: 20,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
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
              ),

              /// Close
              Positioned(
                top: 16,
                right: 20,
                child: Button(
                  icon: 'close',
                  onPressed: () {
                    onClosePressed();
                    context.pop();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
