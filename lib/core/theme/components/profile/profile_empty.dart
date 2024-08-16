import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/components/profile/profile.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Profile(
      backgroundColor: context.color.iconContainer,
      image: AnimatedOpacity(
        duration: const Duration(milliseconds: 333),
        opacity: 0.15,
        child: AssetImg(
          'citizen',
          color: context.color.iconContainer,
          blendMode: BlendMode.color,
        ),
      ),
      nickname: S.current.empty,
      nicknameStyle: context.typo.caption1.copyWith(
        color: context.color.hint,
      ),
    );
  }
}
