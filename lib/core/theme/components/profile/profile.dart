import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/effect/blur.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

part 'profile_size.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    this.backgroundColor,
    this.image,
    this.badge,
    this.nickname,
    this.header,
    this.nicknameStyle,
    this.isConnect = true,
    this.isReady = false,
    this.size = ProfileSize.regular,
  });

  final Widget? header;
  final Widget? image;
  final Color? backgroundColor;
  final String? badge;
  final String? nickname;
  final ProfileSize size;
  final bool isConnect;
  final bool isReady;
  final TextStyle? nicknameStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Profile
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            /// Character
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: size.diameter,
                height: size.diameter,
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: image ?? const AssetImg('citizen'),
              ),
            ),

            /// Is connect
            if (!isConnect)
              Positioned.fill(
                child: Blur(
                  sigma: 6,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: size.diameter,
                    height: size.diameter,
                    decoration: BoxDecoration(
                      color: Palette.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        S.current.gameDrawingNotConnected,
                        style: context.typo.caption1,
                      ),
                    ),
                  ),
                ),
              ),

            /// Header
            if (header != null) header!,

            /// Ready (the badge moves to the left to make room)
            if (isReady)
              Positioned(
                right: -1.5,
                bottom: 1,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.color.success,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const AssetIcon(
                    'check2',
                    useIconColor: true,
                  ),
                ),
              ),

            /// Badge
            if (badge != null)
              Positioned(
                left: isReady ? -1.5 : null,
                right: isReady ? null : -1.5,
                bottom: 1,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.color.onHintContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(1.5),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      badge!,
                      style: context.typo.caption2,
                    ),
                  ),
                ),
              ),
          ],
        ),

        /// Nickname
        if (nickname != null)
          Padding(
            padding: EdgeInsets.only(
              top: switch (size) {
                ProfileSize.icon => 4,
                ProfileSize.mini => 4,
                ProfileSize.small => 4,
                ProfileSize.regular => 8,
                ProfileSize.large => 8,
              },
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                nickname!,
                style: nicknameStyle ?? context.typo.caption1,
                maxLines: 1,
              ),
            ),
          ),
      ],
    );
  }
}
