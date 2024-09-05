part of '../../app_event.dart';

sealed class ReadyPageEvent extends AppEvent {
  const ReadyPageEvent() : super(AppEventScreen.readyPage);
}

/// Exposure
class ReadyPageExposureEvent extends ReadyPageEvent {}
