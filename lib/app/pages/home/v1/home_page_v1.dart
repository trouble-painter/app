import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/home/home_page_model.dart';
import 'package:x_pr/app/pages/home/home_page_state.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view.dart';
import 'package:x_pr/app/pages/home/v1/home_page_layout_v1.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class HomePageV1 extends StatelessWidget {
  const HomePageV1({
    super.key,
    required this.state,
    required this.viewModel,
  });

  final HomePageState state;
  final HomePageModel viewModel;

  @override
  Widget build(BuildContext context) {
    return HomePageLayoutV1(
      isShowRejoinButton: state.isPlayingRoom,

      /// Onboarding
      onboarding: OnboardingPageView(
        nickname: state.nickname,
      ),

      /// Create button
      createButton: Button(
        text: S.current.homeCreateRoom,
        size: ButtonSize.large,
        onPressed: () async {
          final isSuccess = await viewModel.enter();
          if (isSuccess && context.mounted) {
            context.pushNamed(Routes.gamePage.name);
          }
        },
      ),

      /// Join button
      joinButton: Button(
        type: ButtonType.flat,
        color: context.color.text,
        text: S.current.homeJoinRoom,
        size: ButtonSize.large,
        onPressed: viewModel.joinPressed,
      ),

      /// Rejoin button
      rejoinButton: Button(
        width: double.infinity,
        text: S.current.homeRejoinRoom,
        size: ButtonSize.large,
        color: context.color.primary,
        backgroundColor: context.color.hintContainer,
        onPressed: viewModel.rejoinPressed,
      ),

      /// Setting button
      settingButton: Button(
        icon: 'setting',
        onPressed: viewModel.settingPressed,
      ),

      /// Quick start button
      quickStartButton: Button(
        text: S.current.homeRandomQuickStart,
        size: ButtonSize.large,
        onPressed: viewModel.quickStartPressed,
      ),
    );
  }
}
