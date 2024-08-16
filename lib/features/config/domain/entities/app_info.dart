import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
class AppInfo with _$AppInfo {
  factory AppInfo({
    required String packageName,
    required String version,
    required int buildNumber,
  }) = _AppInfo;

  AppInfo._();

  String get appVersion => "$version+$buildNumber";

  factory AppInfo.fromEmpty() => AppInfo(
        version: "",
        packageName: "",
        buildNumber: 0,
      );

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);
}
