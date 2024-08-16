import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) {
        final config = ref.watch(ConfigService.$);
        final configService = ref.read(ConfigService.$.notifier);
        return Column(
          children: [
            /// Language
            Tile(
              title: Text(S.current.settingLanguage),
              trailing: Text(config.language.nativeName),
              onPressed: () {
                configService.changeLanguage(
                  config.language.isKorean ? Language.english : Language.korean,
                );
              },
            ),

            /// Theme
            Tile(
              title: Text(S.current.settingTheme),
              trailing: Text(
                config.isLightTheme
                    ? S.current.settingLight
                    : S.current.settingDark,
              ),
              onPressed: configService.toggleTheme,
            ),
          ],
        );
      },
    );
  }
}
