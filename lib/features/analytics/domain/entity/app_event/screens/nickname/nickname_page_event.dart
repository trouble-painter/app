part of '../../app_event.dart';

sealed class NicknamePageEvent extends AppEvent {
  const NicknamePageEvent() : super(AppEventScreen.nicknamePage);
}

/// Submit
class NicknamePageSubmitEvent extends NicknamePageEvent {
  final bool isEnter;

  NicknamePageSubmitEvent(this.isEnter);
  @override
  Map<String, Object> toJson() => {
        "isEnter": isEnter,
      };
}

/// Terms of service click
class NicknamePageTermsOfServiceClickEvent extends NicknamePageEvent {}
