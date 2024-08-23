part of '../../app_event.dart';

sealed class ReadyPageEvent extends AppEvent {
  const ReadyPageEvent() : super(AppEventScreen.readyPage);
}

/// Exposure
class ReadyPageExposureEvent extends ReadyPageEvent {}

/// Back
class ReadyPageBackClickEvent extends ReadyPageEvent {}

class ReadyPageBackConfirmEvent extends ReadyPageEvent {}

class ReadyPageBackCancelEvent extends ReadyPageEvent {}
