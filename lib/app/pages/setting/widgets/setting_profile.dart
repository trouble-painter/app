import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({
    super.key,
    required this.profile,
    required this.nickname,
    required this.onNicknamePressed,
  });

  final String profile;
  final String nickname;
  final VoidCallback onNicknamePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 106,
          height: 106,
          decoration: BoxDecoration(
            color: context.color.text,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: AssetImg(
            profile,
            width: 67,
          ),
        ),
        GestureDetector(
          onTap: onNicknamePressed,
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nickname,
                  style: context.typo.header3,
                ),
                const SizedBox(width: 4),
                AssetIcon(
                  'edit',
                  color: context.color.subtext4,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
