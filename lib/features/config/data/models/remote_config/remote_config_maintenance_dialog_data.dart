import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/entities/maintenance_dialog_data.dart';

part 'remote_config_maintenance_dialog_data.freezed.dart';
part 'remote_config_maintenance_dialog_data.g.dart';

@freezed
abstract class RemoteConfigMaintenanceDialogData
    with _$RemoteConfigMaintenanceDialogData {
  factory RemoteConfigMaintenanceDialogData({
    required DateTime startedAt,
    required DateTime endedAt,
    required RemoteConfigLang title,
  }) = _RemoteConfigMaintenanceDialogData;

  RemoteConfigMaintenanceDialogData._();

  factory RemoteConfigMaintenanceDialogData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RemoteConfigMaintenanceDialogDataFromJson(json);

  static RemoteConfigMaintenanceDialogData? fromJsonString(String jsonString) {
    return jsonString.isEmpty
        ? null
        : RemoteConfigMaintenanceDialogData.fromJson(jsonDecode(jsonString));
  }

  MaintenanceDialogData fromLanguage(Language language) {
    return MaintenanceDialogData(
      startedAt: startedAt,
      endedAt: endedAt,
      title: title.fromLang(language),
    );
  }
}
