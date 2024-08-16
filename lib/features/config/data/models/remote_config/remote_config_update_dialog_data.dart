import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';

part 'remote_config_update_dialog_data.freezed.dart';
part 'remote_config_update_dialog_data.g.dart';

@freezed
class RemoteConfigUpdateDialogData with _$RemoteConfigUpdateDialogData {
  factory RemoteConfigUpdateDialogData({
    required RemoteConfigLang title,
    required RemoteConfigLang button,
    required RemoteConfigLang url,
  }) = _RemoteConfigUpdateDialogData;

  RemoteConfigUpdateDialogData._();

  UpdateDialogData fromLanguage(Language language) {
    return UpdateDialogData(
      title: title.fromLang(language),
      button: button.fromLang(language),
      url: Uri.parse(url.fromLang(language)),
    );
  }

  factory RemoteConfigUpdateDialogData.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigUpdateDialogDataFromJson(json);

  factory RemoteConfigUpdateDialogData.fromJsonString(String jsonString) {
    return jsonString.isEmpty
        ? RemoteConfigUpdateDialogData(
            title: RemoteConfigLang(),
            button: RemoteConfigLang(),
            url: RemoteConfigLang(),
          )
        : RemoteConfigUpdateDialogData.fromJson(jsonDecode(jsonString));
  }
}
