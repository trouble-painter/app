/// A matched player's accept step (protocol.md MatchingView.ready)
class GameMatchReady {
  const GameMatchReady({
    required this.endsAt,
    required this.acceptMs,
    required this.isAccepted,
  });

  /// When the accept step ends (server clock)
  final DateTime endsAt;

  /// How long the accept step runs
  final int acceptMs;

  /// Whether I accepted
  final bool isAccepted;
}
