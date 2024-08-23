part of '../../app_event.dart';

sealed class MaintenanceDialogEvent extends AppEvent {
  const MaintenanceDialogEvent() : super(AppEventScreen.maintenanceDialog);
}

/// Exposure
class MaintenanceDialogExposureEvent extends MaintenanceDialogEvent {}
