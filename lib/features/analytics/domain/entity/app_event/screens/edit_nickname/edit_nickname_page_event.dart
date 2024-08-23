part of '../../app_event.dart';

sealed class EditNicknamePageEvent extends AppEvent {
  EditNicknamePageEvent() : super(AppEventScreen.editNicknamePage);
}

/// Back click
class EditNicknamePageBackClickEvent extends EditNicknamePageEvent {}

/// Submit
class EditNicknamePageSubmitEvent extends EditNicknamePageEvent {
  final bool isEnter;

  EditNicknamePageSubmitEvent(this.isEnter);

  @override
  Map<String, Object> toJson() => {
        "isEnter": isEnter,
      };
}
