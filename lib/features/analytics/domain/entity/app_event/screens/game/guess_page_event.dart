part of '../../app_event.dart';

sealed class GuessPageEvent extends AppEvent {
  const GuessPageEvent() : super(AppEventScreen.guessPage);
}

/// Exposure
class GuessPageExposureEvent extends GuessPageEvent {}

/// Hint click
class GuessPageHintClickEvent extends GuessPageEvent {
  final int remainSec;

  GuessPageHintClickEvent({required this.remainSec});
  @override
  Map<String, Object> toJson() => {
        "remainSec": remainSec,
      };
}

/// Submit
class GuessPageSubmitEvent extends GuessPageEvent {
  final int remainSec;

  GuessPageSubmitEvent({required this.remainSec});
  @override
  Map<String, Object> toJson() => {
        "remainSec": remainSec,
      };
}
