import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/components/profile/profile.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class ProfileMafia extends StatelessWidget {
  const ProfileMafia({
    super.key,
    required this.mafia,
    this.size = ProfileSize.large,
    this.showNickname = true,
    this.nicknameStyle,
    this.badge,
    this.isConnected,
  });

  final GameUser mafia;
  final ProfileSize size;
  final bool showNickname;
  final bool? isConnected;
  final String? badge;
  final TextStyle? nicknameStyle;

  @override
  Widget build(BuildContext context) {
    return Profile(
      isConnect: isConnected ?? mafia.isConnect,
      backgroundColor: mafia.color,
      nickname: showNickname ? mafia.nickname : null,
      badge: badge,
      nicknameStyle: nicknameStyle,
      size: size,
      image: const Stack(
        alignment: Alignment.center,
        children: [
          /// Citizen
          Positioned.fill(
            child: AssetImg('citizen'),
          ),

          /// Maifa
          Positioned(
            top: 7.57,
            child: AssetImg(
              'mafia',
              width: 18,
            ),
          ),
        ],
      ),
    );
  }
}
