part of '../../app_event.dart';

sealed class VotingPageEvent extends AppEvent {
  const VotingPageEvent() : super(AppEventScreen.votingPage);
}

/// Exposure
class VotingPageExposureEvent extends VotingPageEvent {}

/// User click
class VotingPageUserClickEvent extends VotingPageEvent {
  final int nUser;
  final int remainSec;
  final bool isMe;

  VotingPageUserClickEvent({
    required this.nUser,
    required this.remainSec,
    required this.isMe,
  });

  @override
  Map<String, Object> toJson() => {
        "nUser": nUser,
        "remainSec": remainSec,
        "isMe": isMe,
      };
}

/// Back
class VotingPageBackClickEvent extends VotingPageEvent {}

class VotingPageBackConfirmEvent extends VotingPageEvent {}

class VotingPageBackCancelEvent extends VotingPageEvent {}
