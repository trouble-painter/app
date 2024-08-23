part of '../../app_event.dart';

sealed class NicknamePageEvent extends AppEvent {
  const NicknamePageEvent() : super(AppEventScreen.nicknamePage);
}

/// Submit click
class NicknamePageSubmitClickEvent extends NicknamePageEvent {}

/// Enter click
class NicknamePageEnterClickEvent extends NicknamePageEvent {}

/// Terms of service click
class NicknamePageTermsOfServiceClickEvent extends NicknamePageEvent {}
