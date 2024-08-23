part of '../../app_event.dart';

sealed class GameExitDialogEvent extends AppEvent {
  const GameExitDialogEvent(this.step) : super(AppEventScreen.gameExitDialog);

  final GameStep step;

  @override
  Map<String, Object> toJson() => {
        "screen": step.name,
      };
}

/// Exposure
class GameExitDialogExposureEvent extends GameExitDialogEvent {
  GameExitDialogExposureEvent(super.step);
}

/// Confirm click
class GameExitDialogConfirmClickEvent extends GameExitDialogEvent {
  GameExitDialogConfirmClickEvent(super.step);
}
