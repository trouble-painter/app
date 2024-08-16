import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';

part 'remote_config_min_build_number.freezed.dart';
part 'remote_config_min_build_number.g.dart';

@freezed
class RemoteConfigMinBuildNumber with _$RemoteConfigMinBuildNumber {
  factory RemoteConfigMinBuildNumber({
    @Default(-1) int aos,
    @Default(-1) int ios,
  }) = _RemoteConfigMinBuildNumber;

  RemoteConfigMinBuildNumber._();

  int get platform => PlatformInfo.isAndroid ? aos : ios;

  factory RemoteConfigMinBuildNumber.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigMinBuildNumberFromJson(json);

  factory RemoteConfigMinBuildNumber.fromJsonString(String jsonString) {
    return jsonString.isEmpty
        ? RemoteConfigMinBuildNumber()
        : RemoteConfigMinBuildNumber.fromJson(jsonDecode(jsonString));
  }
}
