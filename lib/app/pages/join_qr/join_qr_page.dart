import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_model.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_state.dart';
import 'package:x_pr/app/pages/join_qr/widgets/join_qr_focus.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';

class JoinQrPage extends StatelessWidget {
  const JoinQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: JoinQrPageModel.new,
      state: (ref, prevState) => JoinQrPageInitState(),
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) => Scaffold(
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),

            switch (state) {
              JoinQrPageInitState() =>
                const Center(child: CircularProgressIndicator()),

              /// Denied
              JoinQrPageDeniedState() => Center(
                  /// Go to settings
                  child: Button(
                    text: S.current.joinQrPageGoToSetting,
                    backgroundColor: context.color.iconContainer,
                    color: context.color.primary,
                    onPressed: viewModel.goToSettings,
                  ),
                ),

              /// Permitted
              JoinQrPageGrantedState(
                focusPaddingBottom: final focusPaddingBottom,
                dimension: final dimension,
                corners: final corners,
                isQrCodeFound: final isQrCodeFound,
              ) =>
                Stack(
                  children: [
                    /// Scanner
                    Positioned.fill(
                      child: MobileScanner(
                        controller: viewModel.controller,
                        onDetect: (capture) async {
                          if (capture.barcodes.isEmpty) return;
                          if (isQrCodeFound) return;
                          final qr = capture.barcodes.first;
                          final isInFocus = viewModel.inInFocus(
                            capture.size,
                            qr.corners,
                          );
                          if (!isInFocus) return;
                          Future.delayed(viewModel.foundAnimDuration * 2,
                              () async {
                            final qrResult = qr.rawValue;
                            final roomId = viewModel.getRoomId(qrResult);
                            if (roomId == null) return;
                            if (await viewModel.joinRoom(roomId) &&
                                context.mounted) {
                              viewModel.controller.dispose();
                              context
                                  .pushReplacementNamed(Routes.gamePage.name);
                            }
                          });
                        },
                      ),
                    ),

                    /// Focus
                    Positioned.fill(
                      child: JoinQrFocus(
                        isQrCodeFound: state.isQrCodeFound,
                        fondAnimDuration: viewModel.foundAnimDuration,
                        focusPaddingBottom: focusPaddingBottom,
                        dimension: dimension,
                      ),
                    ),

                    /// Enter invitation code button
                    Center(
                      child: Button(
                        margin: EdgeInsets.only(
                          top: dimension - focusPaddingBottom + 32,
                        ),
                        text: S.current.joinBottomSheetEnterCode,
                        onPressed: () {
                          context.pushReplacementNamed(Routes.joinPage.name);
                        },
                      ),
                    ),

                    /// Tracking QR
                    if (corners.isNotEmpty && state.isUiTestMode)
                      ...corners.map((offset) {
                        return Positioned(
                          left: offset.dx,
                          top: offset.dy,
                          child: Container(
                            width: 5,
                            height: 5,
                            color: Colors.yellow,
                          ),
                        );
                      }),
                  ],
                ),
            },

            /// PopButton
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: PopButton(),
              ),
            ),

            if (state is JoinQrPageDeniedState) ...[
              /// Bubble
              Positioned(
                right: 134.68.dh,
                bottom: 158.53.dh,
                child: Container(
                  width: 180.32.dw,
                  height: 93.47.dw,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bubble.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  child: TextBalancer(
                    S.current.joinQrPagePermissionRequired,
                    style: context.typo.subHeader2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              /// Sit
              Positioned(
                bottom: 0,
                right: 14.06.dw,
                child: AssetImg(
                  'citizen_sit',
                  height: 211.87.dh,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
