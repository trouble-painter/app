import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/home/home_page_model.dart';
import 'package:trouble_painter/app/pages/home/home_page_state.dart';
import 'package:trouble_painter/app/pages/home/v2/home_game_button.dart';
import 'package:trouble_painter/app/pages/home/v2/widgets/home_page_citizen.dart';
import 'package:trouble_painter/app/pages/home/v2/widgets/home_page_mafia.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

class HomePageV2 extends StatelessWidget {
  const HomePageV2({
    super.key,
    required this.state,
    required this.viewModel,
  });

  final HomePageState state;
  final HomePageModel viewModel;

  @override
  Widget build(BuildContext context) {
    final characterBottom = 310.dh - 16;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            bottom: 310.dh,
            child: AnimTransOpacity(
              child: Stack(
                children: [
                  /// Background
                  const Positioned.fill(
                    child: AssetImg(
                      'home_bg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Title
                  GestureDetector(
                    onTap: viewModel.toggleIsPlayingRoom,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AssetImg(
                            'trouble_painter_shadow',
                            width: 210.dw,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            S.current.homeOnboarding1Title(state.nickname),
                            style: context.typo.subHeader1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Rejoin : isPlayingRoom = true
          IgnorePointer(
            ignoring: !state.isPlayingRoom,
            child: AnimTransOpacity(
              isReverse: !state.isPlayingRoom,
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),

                    /// Cleaning
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: AssetImg(
                        'home_citizen_cleaning',
                        width: 140.dw,
                      ),
                    ),

                    /// Background gradient
                    Container(
                      height: 160.dh,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Palette.gray00.withValues(alpha: 0),
                            Palette.gray00,
                          ],
                          stops: const [0, 0.67],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    /// Rejoin button
                    Button(
                      text: S.current.homeRejoinRoom,
                      size: ButtonSize.large,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      onPressed: viewModel.rejoinPressed,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Main :  : isPlayingRoom = false
          IgnorePointer(
            ignoring: state.isPlayingRoom,
            child: AnimTransOpacity(
              isReverse: state.isPlayingRoom,
              child: Stack(
                children: [
                  /// Bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 310.dh,

                      /// Background gradient
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF434649),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 44.dh),
                          Row(
                            children: [
                              SizedBox(width: 16.dw),

                              /// Quick start
                              Expanded(
                                child: HomeGameButton(
                                  image: 'quick',
                                  height: 130.dh,
                                  text: S.current.homeRandomQuickStart,
                                  color: context.color.onPrimary,
                                  backgroundColor: context.color.primary,
                                  onPressed: viewModel.quickStartPressed,
                                ),
                              ),
                              SizedBox(width: 9.dw),

                              /// Create room
                              Expanded(
                                child: HomeGameButton(
                                  image: 'create',
                                  height: 130.dh,
                                  text: S.current.homeCreateRoom,
                                  color: context.color.primary,
                                  backgroundColor: context.color.onPrimary,
                                  onPressed: () async {
                                    final isSuccess = await viewModel.enter();
                                    if (isSuccess && context.mounted) {
                                      context.pushNamed(Routes.gamePage.name);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 9.dw),

                              /// Join room
                              Expanded(
                                child: HomeGameButton(
                                  image: 'join',
                                  height: 130.dh,
                                  text: S.current.homeJoinRoom,
                                  color: context.color.primary,
                                  backgroundColor: context.color.onPrimary,
                                  onPressed: viewModel.joinPressed,
                                ),
                              ),
                              SizedBox(width: 16.dw),
                            ],
                          ),
                          const Spacer(),
                          SafeArea(
                            top: false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Tutorial
                                Button(
                                  type: ButtonType.outline,
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    bottom: 2,
                                    right: 14,
                                    left: 7,
                                  ),
                                  iconWidget: (color, isInactive) =>
                                      const AssetIcon(
                                    'tutorial',
                                    useIconColor: true,
                                  ),
                                  text: S.current.homeTutorial,
                                  color: context.color.primary,
                                  onPressed: viewModel.onTutorialPressed,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.dh),
                        ],
                      ),
                    ),
                  ),

                  /// Mafia
                  HomePageMafia(bottom: characterBottom),

                  /// Bucket
                  Positioned(
                    bottom: characterBottom + 12,
                    right: 106.dw,
                    child: AssetImg('home_bucket', width: 50.dw),
                  ),

                  /// Citizen
                  HomePageCitizen(bottom: characterBottom),
                ],
              ),
            ),
          ),

          /// Setting
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: AnimTransOpacity(
                child: Button(
                  icon: 'setting',
                  onPressed: viewModel.settingPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
