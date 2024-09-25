import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/splash/splash_page_model.dart';
import 'package:x_pr/app/pages/splash/splash_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/app_bar/transparent_app_bar.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';
import 'package:x_pr/core/view/base_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SplashPageModel.new,
      state: (ref, prevState) => SplashInitState(),
      initState: (ref, viewModel) {
        viewModel.init(
          platformLanguage: ref.read(PlatformInfo.$).language,
          platformBritness: MediaQuery.of(context).platformBrightness,
        );
      },
      onStateChanged: (ref, viewModel, state, oldState) {
        switch (state) {
          case SplashInitState():
            return;
          case SplashUpdateState(updateDialogData: final updateDialog):
            context.pushNamed(
              Routes.updateDialog.name,
              extra: updateDialog,
            );
            return;
          case SplashMaintenanceState(
              maintenanceDialogData: final maintenanceDialogData,
            ):
            context.pushNamed(
              Routes.maintenanceDialog.name,
              extra: maintenanceDialogData,
            );
            return;
          case SplashLoadedState():
            context.goNamed(
              viewModel.goToNickname
                  ? Routes.nicknamePage.name
                  : Routes.homePage.name,
            );
            return;
        }
      },
      builder: (ref, viewModel, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const TransparentAppBar(),
          body: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (LayoutExt.safeAreaSize == Size.zero) {
                      LayoutExt.safeAreaSize = Size(
                        constraints.maxWidth,
                        constraints.maxHeight,
                      );
                    }
                    return const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    );
                  },
                ),
              ),

              /// App Name
              Transform.translate(
                offset: const Offset(33.5, 0),
                child: OverflowBox(
                  maxWidth: 659.4,
                  // maxHeight: 517,
                  child: AnimTransOpacity(
                    child: AssetImg(
                      'splash',
                      width: 659.4.dw,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
