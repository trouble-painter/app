import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_model.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_state.dart';
import 'package:x_pr/app/pages/join_qr/widgets/join_qr_bubble.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';
import 'package:x_pr/core/theme/components/clipper/terrain_clipper.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class JoinQrPage extends StatelessWidget {
  const JoinQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: JoinQrPageModel.new,
      state: (ref, prevState) => JoinQrPageState(),
      builder: (ref, viewModel, state) => Scaffold(
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),

            /// Scanner
            MobileScanner(
              controller: viewModel.controller,
              onDetect: (capture) async {
                if (capture.barcodes.isEmpty || state.isBusy) return;
                final qrResult = capture.barcodes.first.rawValue;
                final roomId = viewModel.getRoomId(qrResult);
                if (roomId == null) return;
                if (await viewModel.joinRoom(roomId) && context.mounted) {
                  viewModel.controller.dispose();
                  context.pushReplacementNamed(Routes.gamePage.name);
                }
              },
            ),

            /// PopButton
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: PopButton(),
              ),
            ),

            /// Terrain
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: TerrainClipper(),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: context.color.terrain,
                ),
              ),
            ),

            /// Hanging
            Positioned(
              right: 16,
              left: 16,
              bottom: 48,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// Category & Keyword
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 30,
                        left: 10,
                        right: 5,
                      ),
                      child: JoinQrBubble(),
                    ),
                  ),

                  Transform.rotate(
                    angle: 3 * pi / 180,
                    child: const AssetImg(
                      'hanging_citizen',
                      width: 70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
