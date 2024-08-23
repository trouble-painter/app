part of '../../app_event.dart';

sealed class VotingPageEvent extends AppEvent {
  const VotingPageEvent() : super(AppEventScreen.votingPage);
}

/// Exposure
class VotingPageExposureEvent extends VotingPageEvent {}

/// Vote
class VotingPageVoteEvent extends VotingPageEvent {
  final int nVoter;
  final int remainMs;
  final bool isMe;

  VotingPageVoteEvent({
    required this.nVoter,
    required this.remainMs,
    required this.isMe,
  });

  @override
  Map<String, Object> toJson() => {
        "nVoter": nVoter,
        "remainMs": remainMs,
        "isMe": isMe,
      };
}
