enum GameReaction {
  mafia,
  citizen,
  like,
  bad,
  good,
  question,
}
/// A reaction someone in the room sent
class GameReactionSent {
  const GameReactionSent({required this.userId, required this.reaction});

  final int userId;
  final GameReaction reaction;
}
