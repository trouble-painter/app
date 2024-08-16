import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:x_pr/features/config/domain/entities/app_info.dart';

class PackageInfoSource {
  static final $ = AutoDisposeProvider<PackageInfoSource>((ref) {
    throw Exception('Will be overrided in main.dart');
  });

  const PackageInfoSource({
    required PackageInfo packageInfo,
  }) : _packageInfo = packageInfo;
  final PackageInfo _packageInfo;

  AppInfo getInfo() {
    return AppInfo(
      packageName: _packageInfo.packageName,
      version: _packageInfo.version,
      buildNumber: int.tryParse(_packageInfo.buildNumber) ?? 0,
    );
  }
}
