import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/icons/shadowed_icon.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/components/profile/profile.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class ProfileCitizen extends StatelessWidget {
  const ProfileCitizen({
    super.key,
    required this.user,
    this.isHost = false,
    this.size = ProfileSize.regular,
    this.showNickname = true,
    this.nicknameStyle,
    this.badge,
    this.isConnect,
    this.isReady = false,
    this.isMafiaFace = false,
  });

  final GameUser user;
  final ProfileSize size;
  final bool isHost;
  final bool showNickname;
  final bool? isConnect;
  final bool isReady;

  /// Shows the mafia's face instead of the citizen's
  final bool isMafiaFace;

  /// Face icon size relative to the profile diameter
  static const double _mafiaFaceRatio = 0.8;
  final String? badge;
  final TextStyle? nicknameStyle;

  @override
  Widget build(BuildContext context) {
    return Profile(
      isConnect: isConnect ?? user.isConnect,
      isReady: isReady,
      backgroundColor: user.color,
      nickname: showNickname ? user.nickname : null,
      badge: badge,
      nicknameStyle: nicknameStyle,
      size: size,
      image: isMafiaFace
          ? Center(
              child: ShadowedIcon(
                'mafia',
                size: size.diameter * _mafiaFaceRatio,
                useIconColor: true,
              ),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                /// Citizen
                const Positioned.fill(
                  child: AssetImg('citizen'),
                ),

                /// Hat
                Positioned(
                  top: size.hatTop,
                  child: AssetImg(
                    'hat',
                    width: size.hatWidth,
                    blendMode: BlendMode.srcATop,
                    color: user.hatColor,
                  ),
                ),

                /// Hat line
                Positioned(
                  top: size.hatTop,
                  child: AssetImg(
                    'hat_line',
                    width: size.hatWidth,
                    color: Palette.black.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),
      header: isHost
          ? const Positioned(
              top: -10,
              child: AssetImg(
                'host',
                width: 20,
                height: 20,
              ),
            )
          : null,
    );
  }
}
