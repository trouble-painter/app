import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';

part 'remote_config_admob_id.freezed.dart';
part 'remote_config_admob_id.g.dart';

@freezed
class RemoteConfigAdmobId with _$RemoteConfigAdmobId {
  factory RemoteConfigAdmobId({
    required String aos,
    required String ios,
  }) = _RemoteConfigAdmobId;

  RemoteConfigAdmobId._();

  String get id => PlatformInfo.isAndroid ? aos : ios;

  factory RemoteConfigAdmobId.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigAdmobIdFromJson(json);

  factory RemoteConfigAdmobId.fromJsonString(String jsonString) =>
      jsonString.isEmpty
          ? RemoteConfigAdmobId(aos: "", ios: "")
          : RemoteConfigAdmobId.fromJson(jsonDecode(jsonString));
}
