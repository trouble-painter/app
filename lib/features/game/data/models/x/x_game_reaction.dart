import 'package:x_pr/core/utils/ext/string_ext.dart';
import 'package:x_pr/features/game/domain/entities/game_reaction.dart';

enum XGameReaction {
  mafia("HAMSTER"),
  citizen("BEAR"),
  like("HEART"),
  bad("POOP"),
  good("BEST"),
  question("QUESTION");

  const XGameReaction(this.value);
  final String value;

  factory XGameReaction.fromJson(String json) {
    for (final type in values) {
      if (type.value.eq(json)) return type;
    }
    throw UnimplementedError('$json cannot be convert to XGameReactionType');
  }

  factory XGameReaction.fromEntity(GameReaction entity) => switch (entity) {
        GameReaction.mafia => mafia,
        GameReaction.citizen => citizen,
        GameReaction.like => like,
        GameReaction.bad => bad,
        GameReaction.good => good,
        GameReaction.question => question,
      };

  GameReaction toEntity() => switch (this) {
        mafia => GameReaction.mafia,
        citizen => GameReaction.citizen,
        like => GameReaction.like,
        bad => GameReaction.bad,
        good => GameReaction.good,
        question => GameReaction.question,
      };
}
