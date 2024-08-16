import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/components/profile/profile.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';

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
  });

  final GameUser user;
  final ProfileSize size;
  final bool isHost;
  final bool showNickname;
  final bool? isConnect;
  final String? badge;
  final TextStyle? nicknameStyle;

  @override
  Widget build(BuildContext context) {
    return Profile(
      isConnect: isConnect ?? user.isConnect,
      backgroundColor: user.color,
      nickname: showNickname ? user.nickname : null,
      badge: badge,
      nicknameStyle: nicknameStyle,
      size: size,
      image: Stack(
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
              color: Palette.black.withOpacity(0.2),
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
