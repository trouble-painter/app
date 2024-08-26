part of '../../app_event.dart';

sealed class QuickStartWaitingPageEvent extends AppEvent {
  const QuickStartWaitingPageEvent()
      : super(AppEventScreen.quickStartWaitingPage);
}

/// Exposure
class QuickStartWaitingPageExposureEvent extends QuickStartWaitingPageEvent {}
