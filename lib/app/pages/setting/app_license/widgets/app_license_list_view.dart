import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';

class AppLicenseListView extends StatelessWidget {
  const AppLicenseListView({
    super.key,
    required this.state,
    required this.config,
  });

  final AppLicensePageState state;
  final Config config;

  bool get isBgmDisabled => config.isBgmDisabled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 64,
      ),
      itemCount: state.packages.length + (isBgmDisabled ? 0 : 1),
      itemBuilder: (context, index) {
        if (!isBgmDisabled && index == 0) {
          /// Bgm license
          return Tile(
            title: Text(S.current.appLicenseBgm),
            isTrailingIcon: true,
            onPressed: () {
              config.bgmLicenseUrl.launchBrowser();
            },
          );
        } else {
          /// Open source license

          final package = state.packages[index + (isBgmDisabled ? 0 : -1)];
          final liceseIndexList = state.packageLicenseMap[package] ?? [];
          return Tile(
            title: AutoSizeText(
              package,
              maxLines: 1,
            ),
            trailing: Text(
              S.current.appLicenseTotal(liceseIndexList.length),
            ),
            onPressed: () {
              context.pushNamed(
                Routes.licenseDetailPage.name,
                extra: {
                  "package": package,
                  "licenseEntries": liceseIndexList.map((index) {
                    return state.licenses[index];
                  }).toList(),
                },
              );
            },
          );
        }
      },
    );
  }
}
