import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';

part 'maintenance_dialog_data.freezed.dart';
part 'maintenance_dialog_data.g.dart';

@freezed
class MaintenanceDialogData with _$MaintenanceDialogData {
  factory MaintenanceDialogData({
    required DateTime startedAt,
    required DateTime endedAt,
    required String title,
  }) = _MaintenanceDialogData;

  MaintenanceDialogData._();

  bool get isMaintenance {
    final isAfterStartedAt = NetworkTime.now.isAfter(startedAt);
    final isBeforeEndedAt = NetworkTime.now.isBefore(endedAt);
    return isAfterStartedAt && isBeforeEndedAt;
  }

  factory MaintenanceDialogData.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceDialogDataFromJson(json);
}
