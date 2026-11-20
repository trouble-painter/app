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
  final bool isCancel;

  VotingPageVoteEvent({
    required this.nVoter,
    required this.remainMs,
    required this.isMe,
    required this.isCancel,
  });

  @override
  Map<String, Object> toJson() => {
        "nVoter": nVoter,
        "remainMs": remainMs,
        "isMe": isMe,
        "isCancel": isCancel,
      };
}

/// The top-voted suspect shown above the canvas changed.
/// [nSuspect] is above 1 on a tie.
class VotingPageSuspectChangedEvent extends VotingPageEvent {
  final int nSuspect;
  final int nVoter;

  VotingPageSuspectChangedEvent({
    required this.nSuspect,
    required this.nVoter,
  });

  @override
  Map<String, Object> toJson() => {
        "nSuspect": nSuspect,
        "nVoter": nVoter,
      };
}
