import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_pr/app/pages/dev/component/widgets/component_section.dart';
import 'package:x_pr/app/pages/dev/component/widgets/measure.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';

class IconSection extends StatelessWidget {
  const IconSection({super.key});

  Future<List<String>> getAssetManifest() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    return manifestMap.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAssetManifest(),
      builder: (context, snapshot) {
        final assets = snapshot.data ?? [];

        return ListView(
          children: assets
              .where((asset) => asset.endsWith('.svg'))
              .map((iconPath) => iconPath.replaceAll('assets/icons/', ''))
              .map((iconPath) => iconPath.replaceAll('.svg', ''))
              .map(
                (icon) => ComponentSection(
                  title: icon,
                  children: [
                    Measure(
                      child: AssetIcon(icon),
                    ),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
