part of '../../app_event.dart';

sealed class NicknamePageEvent extends AppEvent {
  const NicknamePageEvent() : super(AppEventScreen.nicknamePage);
}

/// Submit
class NicknamePageSubmitEvent extends NicknamePageEvent {}

/// Enter
class NicknamePageEnterEvent extends NicknamePageEvent {}
