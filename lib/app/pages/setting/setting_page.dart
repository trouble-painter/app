import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/setting_page_model.dart';
import 'package:x_pr/app/pages/setting/setting_page_state.dart';
import 'package:x_pr/app/pages/setting/widgets/setting_app_bar.dart';
import 'package:x_pr/app/pages/setting/widgets/setting_profile.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/app_bar/transparent_app_bar.dart';
import 'package:x_pr/core/theme/components/buttons/switch_button/switch_button.dart';
import 'package:x_pr/core/theme/components/loader/loader.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/components/tiles/tile_section.dart';
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
          notificationSetting: config.notificationSetting,
        );
      },
      builder: (ref, viewModel, state) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const TransparentAppBar(),
        body: Loader(
          isBusy: state.isBusy,
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: 86,
                    bottom: 0.1.vh,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      /// Profile
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SettingProfile(
                          profile: state.profile,
                          nickname: state.nickname,
                          onNicknamePressed: viewModel.editNicknamePressed,
                        ),
                      ),

                      /// Configure
                      TileSection(
                        title: S.current.settingGameConfigure,
                        children: [
                          /// Language
                          Tile(
                            title: Text(S.current.settingLanguage),
                            trailing: Text(state.language.nativeName),
                            leadingIcon: 'language',
                            onPressed: viewModel.languagePressed,
                          ),

                          /// BGM
                          if (!state.isBgmDisabled)
                            Tile(
                              title: const Text("BGM"),
                              leadingIcon: 'bgm',
                              trailing: SwitchButton(
                                value: !state.isBgmMute,
                                onChanged: (_) => viewModel.toggleBgmMute(),
                              ),
                              onPressed: viewModel.toggleBgmMute,
                            ),

                          /// Quick Start Notification
                          if (!state.notificationSetting.disableQuickStartNoti)
                            Tile(
                              title: Text(
                                S.current.settingQuickStartNotification,
                              ),
                              leadingIcon: 'notice',
                              trailing: SwitchButton(
                                value: state
                                    .notificationSetting.receiveQuickStartNoti,
                                onChanged: (_) =>
                                    viewModel.toggleQuickStartNotification(),
                              ),
                              onPressed: viewModel.toggleQuickStartNotification,
                            ),
                        ],
                      ),

                      /// Community
                      TileSection(
                        title: S.current.settingCommunity,
                        children: [
                          /// Instagram
                          Tile(
                            leadingIcon: 'instagram',
                            title: Text(S.current.settingInstagram),
                            onPressed: viewModel.onInstagramPressed,
                            isTrailingIcon: true,
                          ),

                          /// Discord
                          Tile(
                            leadingIcon: 'discord',
                            title: Text(S.current.settingDiscord),
                            onPressed: viewModel.onDiscordPressed,
                            isTrailingIcon: true,
                          ),
                        ],
                      ),

                      /// Contact
                      TileSection(
                        title: S.current.settingContact,
                        children: [
                          /// Contact us
                          Tile(
                            leadingIcon: 'message',
                            title: Text(S.current.settingContactUs),
                            onPressed: viewModel.onContactUsPressed,
                            isTrailingIcon: true,
                          ),

                          /// Suggest keywords
                          Tile(
                            leadingIcon: 'idea',
                            title: Text(S.current.settingSuggestKeywords),
                            onPressed: viewModel.onSuggestKeywordsPressed,
                            isTrailingIcon: true,
                          ),
                        ],
                      ),

                      /// About
                      TileSection(
                        title: S.current.settingAbout,
                        children: [
                          /// Notice
                          Tile(
                            leadingIcon: 'announcement',
                            title: Text(S.current.settingNotice),
                            onPressed: viewModel.onNoticePressed,
                            isTrailingIcon: true,
                          ),

                          /// Terms of service
                          Tile(
                            leadingIcon: 'term',
                            title: Text(S.current.termsOfService),
                            onPressed: viewModel.onTermsOfServicePressed,
                            isTrailingIcon: true,
                          ),

                          /// License
                          Tile(
                            leadingIcon: 'license',
                            title: Text(S.current.settingLicense),
                            onPressed: viewModel.licensePressed,
                            isTrailingIcon: true,
                          ),

                          /// Version
                          Tile(
                            leadingIcon: 'information',
                            title: Text(S.current.settingVersion),
                            trailing: Text(state.appInfo.version),
                            onPressed: viewModel.versionPressed,
                          ),
                        ],
                      ),

                      /// Dev
                      if (viewModel.isShowDev)
                        TileSection(
                          title: S.current.settingDevelopment,
                          children: [
                            Tile(
                              title: Text(S.current.dev),
                              onPressed: () {
                                context.pushNamed(Routes.devPage.name);
                              },
                              isTrailingIcon: true,
                            ),
                          ],
                        ),
                    ].gap(height: 40).conditionalWrap(
                          builder: (child, index) => AnimTransOpacity(
                            delayIndex: index + 1,
                            child: child,
                          ),
                        ),
                  ),
                ),

                /// AppBar
                AnimTransOpacity(
                  delayIndex: 0,
                  child: SettingAppBar(
                    onPopPressed: viewModel.onPopPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
