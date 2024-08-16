import 'package:x_pr/features/config/domain/entities/maintenance_dialog_data.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';

sealed class SplashPageState {}

class SplashInitState extends SplashPageState {}

class SplashUpdateState extends SplashPageState {
  final UpdateDialogData updateDialogData;

  SplashUpdateState({required this.updateDialogData});
}

class SplashMaintenanceState extends SplashPageState {
  final MaintenanceDialogData maintenanceDialogData;

  SplashMaintenanceState({required this.maintenanceDialogData});
}

class SplashLoadedState extends SplashPageState {}
