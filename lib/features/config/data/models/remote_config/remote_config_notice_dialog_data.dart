import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';

part 'remote_config_notice_dialog_data.freezed.dart';
part 'remote_config_notice_dialog_data.g.dart';

@freezed
class RemoteConfigNoticeDialogData with _$RemoteConfigNoticeDialogData {
  factory RemoteConfigNoticeDialogData({
    required int version,
    required int exposureIntervalHour,
    required bool isShow,
    required DateTime startedAt,
    required DateTime endedAt,
    required RemoteConfigLang title,
    required RemoteConfigLang desc,
    required RemoteConfigLang url,
  }) = _RemoteConfigNoticeDialogData;

  RemoteConfigNoticeDialogData._();

  NoticeDialogData fromLanguage(Language language) {
    return NoticeDialogData(
      version: version,
      exposureIntervalHour: exposureIntervalHour,
      isShow: isShow,
      startedAt: startedAt,
      endedAt: endedAt,
      title: title.fromLang(language),
      desc: desc.fromLang(language),
      url: url.isEmpty(language) ? null : Uri.parse(url.fromLang(language)),
    );
  }

  factory RemoteConfigNoticeDialogData.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigNoticeDialogDataFromJson(json);

  static RemoteConfigNoticeDialogData? fromJsonString(String jsonString) {
    return jsonString.isEmpty
        ? null
        : RemoteConfigNoticeDialogData.fromJson(jsonDecode(jsonString));
  }
}
