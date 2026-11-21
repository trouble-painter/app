import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/wire.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_category.dart';
import 'package:trouble_painter/features/game/domain/entities/game_match_ready.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

/// protocol.md 6. Data structures

class LimitsView {
  final int drawThrottleMs;
  final int reactionThrottleMs;
  final int maxStrokePoints;
  final int maxAnswerLength;

  const LimitsView({
    required this.drawThrottleMs,
    required this.reactionThrottleMs,
    required this.maxStrokePoints,
    required this.maxAnswerLength,
  });

  factory LimitsView.fromJson(Json json) => LimitsView(
        drawThrottleMs: json['drawThrottleMs'],
        reactionThrottleMs: json['reactionThrottleMs'],
        maxStrokePoints: json['maxStrokePoints'],
        maxAnswerLength: json['maxAnswerLength'],
      );
}

/// What a host may pick in a rule (`HELLO.ruleSpec`)
class RuleSpecView {
  /// The fewest strokes a turn can allow
  final int minStrokesPerTurn;

  /// The most strokes a turn can allow short of no limit
  final int maxStrokesPerTurn;

  /// The languages a host can pick for the keywords, in the server's order
  final List<Language> keywordLanguages;

  const RuleSpecView({
    required this.minStrokesPerTurn,
    required this.maxStrokesPerTurn,
    required this.keywordLanguages,
  });

  /// Skips a locale this app has no [Language] for.
  factory RuleSpecView.fromJson(Json json) => RuleSpecView(
        minStrokesPerTurn: json['strokesPerTurn']['min'],
        maxStrokesPerTurn: json['strokesPerTurn']['max'],
        keywordLanguages: (json['keywordLocales'] as List)
            .map((wire) => fromWire(ProtocolLocale.values, wire)?.language)
            .nonNulls
            .toList(),
      );
}

class PlayerView {
  final int id;
  final String nickname;
  final PlayerColor color;
  final bool isConnected;
  final bool isReady;

  const PlayerView({
    required this.id,
    required this.nickname,
    required this.color,
    required this.isConnected,
    required this.isReady,
  });

  factory PlayerView.fromJson(Json json) => PlayerView(
        id: json['id'],
        nickname: json['nickname'],
        color: requireWire(PlayerColor.values, json['color']),
        isConnected: json['isConnected'],
        isReady: json['isReady'],
      );

  GameUser toEntity() => GameUser(
        id: id,
        nickname: nickname,
        playerColor: color,
        isConnect: isConnected,
        isReady: isReady,
      );

  static List<PlayerView> listFromJson(Object? json) =>
      (json as List).map((e) => PlayerView.fromJson(e)).toList();
}

class GameOptionView {
  final int minPlayers;
  final int maxPlayers;
  final int readyMs;
  final int introAnimationMs;
  final int roundAnimationMs;
  final int rounds;
  final int turnMs;
  /// What a new room's rule starts with and what a reset goes back to
  final int defaultStrokesPerTurn;
  final int voteMs;
  final int answerMs;

  const GameOptionView({
    required this.minPlayers,
    required this.maxPlayers,
    required this.readyMs,
    required this.introAnimationMs,
    required this.roundAnimationMs,
    required this.rounds,
    required this.turnMs,
    required this.defaultStrokesPerTurn,
    required this.voteMs,
    required this.answerMs,
  });

  factory GameOptionView.fromJson(Json json) => GameOptionView(
        minPlayers: json['minPlayers'],
        maxPlayers: json['maxPlayers'],
        readyMs: json['readyMs'],
        introAnimationMs: json['introAnimationMs'],
        roundAnimationMs: json['roundAnimationMs'],
        rounds: json['rounds'],
        turnMs: json['turnMs'],
        defaultStrokesPerTurn: json['defaultStrokesPerTurn'],
        voteMs: json['voteMs'],
        answerMs: json['answerMs'],
      );
}

class GameRuleView {
  /// Null means no limit
  final int? strokesPerTurn;
  /// Empty means all categories
  final List<String> categoryIds;
  final ProtocolLocale keywordLocale;

  const GameRuleView({
    required this.strokesPerTurn,
    required this.categoryIds,
    required this.keywordLocale,
  });

  factory GameRuleView.fromJson(Json json) => GameRuleView(
        strokesPerTurn: json['strokesPerTurn'],
        categoryIds: List<String>.from(json['categoryIds']),
        keywordLocale:
            requireWire(ProtocolLocale.values, json['keywordLocale']),
      );

  GameRule toEntity() => GameRule(
        strokesPerTurn: strokesPerTurn,
        categoryIds: categoryIds,
        keywordLanguage: keywordLocale.language,
      );

  static Json toJson(GameRule rule) => {
        'strokesPerTurn': rule.strokesPerTurn,
        'categoryIds': rule.categoryIds,
        'keywordLocale':
            toWire(ProtocolLocale.fromLanguage(rule.keywordLanguage)),
      };
}

class CategoryView {
  final String id;

  /// In the rule's keyword language
  final String name;

  const CategoryView({required this.id, required this.name});

  factory CategoryView.fromJson(Json json) => CategoryView(
        id: json['id'],
        name: json['name'],
      );

  GameCategory toEntity() => GameCategory(id: id, name: name);

  static List<CategoryView> listFromJson(Object? json) =>
      (json as List).map((e) => CategoryView.fromJson(e)).toList();
}

/// Per receiver. [keyword] is null for the mafia.
class GameView {
  final GameRole role;
  final String category;
  final String? keyword;
  final List<int> turnOrder;

  const GameView({
    required this.role,
    required this.category,
    required this.keyword,
    required this.turnOrder,
  });

  factory GameView.fromJson(Json json) => GameView(
        role: requireWire(GameRole.values, json['role']),
        category: json['category'],
        keyword: json['keyword'],
        turnOrder: List<int>.from(json['turnOrder']),
      );
}

class TurnView {
  final int round;
  final int turn;
  final int drawerId;
  final DateTime startedAt;
  final DateTime drawFrom;
  final DateTime deadline;

  const TurnView({
    required this.round,
    required this.turn,
    required this.drawerId,
    required this.startedAt,
    required this.drawFrom,
    required this.deadline,
  });

  factory TurnView.fromJson(Json json) => TurnView(
        round: json['round'],
        turn: json['turn'],
        drawerId: json['drawerId'],
        startedAt: epochMs(json['startedAt']),
        drawFrom: epochMs(json['drawFrom']),
        deadline: epochMs(json['deadline']),
      );
}

Size canvasFromJson(Object? json) {
  final map = json as Json;
  return Size((map['w'] as num).toDouble(), (map['h'] as num).toDouble());
}

Json canvasToJson(Size size) => {'w': size.width, 'h': size.height};

Stroke strokeFromJson(Object? json) => Stroke.fromJson(json as Json);

class SketchView {
  final int userId;
  final Size canvas;
  final List<Stroke> strokes;

  const SketchView({
    required this.userId,
    required this.canvas,
    required this.strokes,
  });

  factory SketchView.fromJson(Json json) => SketchView(
        userId: json['userId'],
        canvas: canvasFromJson(json['canvas']),
        strokes: (json['strokes'] as List).map(strokeFromJson).toList(),
      );

  static SketchView? maybeFromJson(Object? json) =>
      json == null ? null : SketchView.fromJson(json as Json);

  static List<SketchView> listFromJson(Object? json) =>
      (json as List).map((e) => SketchView.fromJson(e)).toList();
}

/// Voter id -> target id
typedef VotesView = Map<int, int>;

VotesView votesFromJson(Object? json) => (json as Json).map(
      (voterId, targetId) => MapEntry(int.parse(voterId), targetId as int),
    );

class ResultView {
  final int mafiaId;
  final int? accusedId;
  final String answer;
  final String? mafiaGuess;
  final GameRole winner;

  const ResultView({
    required this.mafiaId,
    required this.accusedId,
    required this.answer,
    required this.mafiaGuess,
    required this.winner,
  });

  factory ResultView.fromJson(Json json) => ResultView(
        mafiaId: json['mafiaId'],
        accusedId: json['accusedId'],
        answer: json['answer'],
        mafiaGuess: json['mafiaGuess'],
        winner: requireWire(GameRole.values, json['winner']),
      );
}

sealed class PhaseView {
  const PhaseView();

  factory PhaseView.fromJson(Json json) {
    final type = requireWire(PhaseType.values, json['type']);
    if (type == PhaseType.wait) return WaitPhaseView.fromJson(json);

    final game = GameView.fromJson(json['game']);
    return switch (type) {
      PhaseType.wait => WaitPhaseView.fromJson(json),
      PhaseType.ready => ReadyPhaseView(
          game: game,
          deadline: epochMs(json['deadline']),
        ),
      PhaseType.drawing => DrawingPhaseView(
          game: game,
          turn: TurnView.fromJson(json['turn']),
          sketches: SketchView.listFromJson(json['sketches']),
          current: SketchView.maybeFromJson(json['current']),
        ),
      PhaseType.vote => VotePhaseView(
          game: game,
          sketches: SketchView.listFromJson(json['sketches']),
          votes: votesFromJson(json['votes']),
          deadline: epochMs(json['deadline']),
        ),
      PhaseType.answer => AnswerPhaseView(
          game: game,
          sketches: SketchView.listFromJson(json['sketches']),
          accusedId: json['accusedId'],
          typing: json['typing'],
          deadline: epochMs(json['deadline']),
        ),
      PhaseType.end => EndPhaseView(
          game: game,
          sketches: SketchView.listFromJson(json['sketches']),
          result: ResultView.fromJson(json['result']),
        ),
    };
  }
}

/// [categories] are the ones a host can pick for the rule.
class WaitPhaseView extends PhaseView {
  final List<CategoryView> categories;

  const WaitPhaseView({required this.categories});

  factory WaitPhaseView.fromJson(Json json) => WaitPhaseView(
        categories: CategoryView.listFromJson(json['categories']),
      );
}

class ReadyPhaseView extends PhaseView {
  final GameView game;
  final DateTime deadline;

  const ReadyPhaseView({required this.game, required this.deadline});
}

class DrawingPhaseView extends PhaseView {
  final GameView game;
  final TurnView turn;
  final List<SketchView> sketches;

  /// Sketch of the current turn, null before the first stroke
  final SketchView? current;

  const DrawingPhaseView({
    required this.game,
    required this.turn,
    required this.sketches,
    required this.current,
  });
}

class VotePhaseView extends PhaseView {
  final GameView game;
  final List<SketchView> sketches;
  final VotesView votes;
  final DateTime deadline;

  const VotePhaseView({
    required this.game,
    required this.sketches,
    required this.votes,
    required this.deadline,
  });
}

class AnswerPhaseView extends PhaseView {
  final GameView game;
  final List<SketchView> sketches;

  /// The accused, who is the mafia
  final int accusedId;
  final String typing;
  final DateTime deadline;

  const AnswerPhaseView({
    required this.game,
    required this.sketches,
    required this.accusedId,
    required this.typing,
    required this.deadline,
  });
}

class EndPhaseView extends PhaseView {
  final GameView game;
  final List<SketchView> sketches;
  final ResultView result;

  const EndPhaseView({
    required this.game,
    required this.sketches,
    required this.result,
  });
}

class RoomView {
  final String id;
  final ProtocolLocale locale;
  final bool isQuickStart;
  final int hostId;

  /// In join order
  final List<PlayerView> players;
  final GameOptionView option;
  final GameRuleView rule;
  final PhaseView phase;

  const RoomView({
    required this.id,
    required this.locale,
    required this.isQuickStart,
    required this.hostId,
    required this.players,
    required this.option,
    required this.rule,
    required this.phase,
  });

  factory RoomView.fromJson(Json json) => RoomView(
        id: json['id'],
        locale: requireWire(ProtocolLocale.values, json['locale']),
        isQuickStart: json['isQuickStart'],
        hostId: json['hostId'],
        players: PlayerView.listFromJson(json['players']),
        option: GameOptionView.fromJson(json['option']),
        rule: GameRuleView.fromJson(json['rule']),
        phase: PhaseView.fromJson(json['phase']),
      );

  static RoomView? maybeFromJson(Object? json) =>
      json == null ? null : RoomView.fromJson(json as Json);
}

class MatchReadyView {
  /// When the accept step ends
  final DateTime endsAt;

  /// How long the accept step runs
  final int acceptMs;

  final bool isAccepted;

  const MatchReadyView({
    required this.endsAt,
    required this.acceptMs,
    required this.isAccepted,
  });

  factory MatchReadyView.fromJson(Json json) => MatchReadyView(
        endsAt: epochMs(json['endsAt']),
        acceptMs: json['acceptMs'],
        isAccepted: json['isAccepted'],
      );

  static MatchReadyView? maybeFromJson(Object? json) =>
      json == null ? null : MatchReadyView.fromJson(json as Json);

  GameMatchReady toEntity() => GameMatchReady(
        endsAt: endsAt,
        acceptMs: acceptMs,
        isAccepted: isAccepted,
      );
}

class MatchingView {
  final ProtocolLocale locale;

  /// Connected people in the locale queue, including me
  final int waitingCount;

  /// When the waiting people are matched; null until enough are waiting
  final DateTime? startsAt;

  /// How many must wait before the countdown to [startsAt] runs
  final int minCount;

  /// How long the countdown to [startsAt] runs
  final int waitMs;

  /// Only for a matched player in the accept step
  final MatchReadyView? ready;

  const MatchingView({
    required this.locale,
    required this.waitingCount,
    this.startsAt,
    required this.minCount,
    required this.waitMs,
    this.ready,
  });

  factory MatchingView.fromJson(Json json) => MatchingView(
        locale: requireWire(ProtocolLocale.values, json['locale']),
        waitingCount: json['waitingCount'],
        startsAt: json['startsAt'] == null ? null : epochMs(json['startsAt']),
        minCount: json['minCount'],
        waitMs: json['waitMs'],
        ready: MatchReadyView.maybeFromJson(json['ready']),
      );

  static MatchingView? maybeFromJson(Object? json) =>
      json == null ? null : MatchingView.fromJson(json as Json);
}
