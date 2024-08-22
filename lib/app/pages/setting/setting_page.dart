import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/language/language_bottom_sheet.dart';
import 'package:x_pr/app/pages/setting/setting_page_model.dart';
import 'package:x_pr/app/pages/setting/setting_page_state.dart';
import 'package:x_pr/app/pages/setting/widgets/setting_app_bar.dart';
import 'package:x_pr/app/pages/setting/widgets/setting_profile.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/app_bar/transparent_app_bar.dart';
import 'package:x_pr/core/theme/components/buttons/switch_button/switch_button.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SettingPageModel.new,
      state: (ref, prevState) {
        final config = ref.watch(ConfigService.$);

        return SettingPageState(
          profile: 'trouble_painter',
          nickname: config.nickname,
          language: config.language,
          isBgmDisabled: config.isBgmDisabled,
          isBgmMute: config.isBgmMute,
          appInfo: config.appInfo,
        );
      },
      builder: (ref, viewModel, state) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const TransparentAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              /// AppBar
              const AnimTransOpacity(
                delayIndex: 0,
                child: SettingAppBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 0.1.vh),
                  child: Column(
                    children: <Widget>[
                      /// Profile
                      SettingProfile(
                        profile: state.profile,
                        nickname: state.nickname,
                        onNicknamePressed: () {
                          context.pushNamed(Routes.editNicknamePage.name);
                        },
                      ),
                      const SizedBox(height: 48),

                      /// Language
                      Tile(
                        title: Text(S.current.settingLanguage),
                        trailing: Text(state.language.nativeName),
                        onPressed: () {
                          context.bottomSheet(const LanguageBottomSheet());
                        },
                      ),

                      /// BGM
                      if (!state.isBgmDisabled)
                        Tile(
                          title: const Text("BGM"),
                          trailing: SwitchButton(
                            value: !state.isBgmMute,
                            onChanged: (_) => viewModel.toggleBgmMute(),
                          ),
                          onPressed: viewModel.toggleBgmMute,
                        ),

                      /// 문의하기
                      Tile(
                        title: Text(S.current.settingContactUs),
                        onPressed: viewModel.onContactUsPressed,
                      ),

                      /// Terms of service
                      Tile(
                        title: Text(S.current.termsOfService),
                        onPressed: viewModel.showTermsOfService,
                      ),

                      /// Open source license
                      Tile(
                        title: Text(S.current.settingLicense),
                        onPressed: () {
                          context.pushNamed(Routes.licensePage.name);
                        },
                      ),

                      /// Version
                      Tile(
                        title: Text(S.current.settingVersion),
                        trailing: Text(state.appInfo.version),
                        onPressed: viewModel.copyUuid,
                      ),

                      /// Dev
                      if (viewModel.isShowDev)
                        Tile(
                          title: Text(S.current.dev),
                          onPressed: () {
                            context.pushNamed(Routes.devPage.name);
                          },
                        ),
                    ].conditionalWrap(
                      builder: (child, index) => AnimTransOpacity(
                        delayIndex: index + 1,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
