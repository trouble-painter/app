part of '../../app_event.dart';

sealed class SplashPageEvent extends AppEvent {
  const SplashPageEvent() : super(AppEventScreen.splashPage);
}
