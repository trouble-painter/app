/// JSON fixtures shaped as protocol.md 6.
Map<String, dynamic> playerJson(int id, {String color = 'RED'}) => {
      'id': id,
      'nickname': 'p$id',
      'color': color,
      'isConnected': true,
    };

Map<String, dynamic> optionJson() => {
      'minPlayers': 3,
      'maxPlayers': 10,
      'readyMs': 5000,
      'introAnimationMs': 3000,
      'roundAnimationMs': 2000,
      'rounds': 2,
      'turnMs': 10000,
      'defaultStrokesPerTurn': 1,
      'voteMs': 30000,
      'answerMs': 20000,
    };

Map<String, dynamic> ruleJson({
  int? strokesPerTurn = 1,
  List<String> categoryIds = const [],
}) =>
    {
      'strokesPerTurn': strokesPerTurn,
      'categoryIds': categoryIds,
    };

Map<String, dynamic> waitPhaseJson() => {
      'type': 'WAIT',
      'categories': [
        {'id': 'animal', 'name': '동물'},
        {'id': 'food', 'name': '음식'},
      ],
    };

Map<String, dynamic> roomJson({
  int hostId = 1,
  List<Map<String, dynamic>>? players,
  Map<String, dynamic>? phase,
  Map<String, dynamic>? rule,
}) =>
    {
      'id': 'K7Q2ZP',
      'locale': 'KO',
      'isQuickStart': false,
      'hostId': hostId,
      'players': players ?? [playerJson(1), playerJson(2, color: 'ORANGE')],
      'option': optionJson(),
      'rule': rule ?? ruleJson(),
      'phase': phase ?? waitPhaseJson(),
    };

Map<String, dynamic> limitsJson() => {
      'drawThrottleMs': 50,
      'reactionThrottleMs': 500,
      'maxStrokePoints': 500,
      'maxAnswerLength': 20,
      'maxStrokesPerTurn': 5,
    };

Map<String, dynamic> helloJson({
  Map<String, dynamic>? room,
  Map<String, dynamic>? matching,
  int serverTime = 1700000000000,
}) =>
    {
      'type': 'HELLO',
      'data': {
        'serverTime': serverTime,
        'limits': limitsJson(),
        'room': room,
        'matching': matching,
      },
    };

/// Three players: 1 RED, 2 ORANGE, 3 YELLOW.
List<Map<String, dynamic>> threePlayersJson() => [
      playerJson(1),
      playerJson(2, color: 'ORANGE'),
      playerJson(3, color: 'YELLOW'),
    ];

/// Turn order 2 -> 1 -> 3. [keyword] is null for the mafia.
Map<String, dynamic> gameJson({
  String role = 'CITIZEN',
  String? keyword = '도시',
}) =>
    {
      'role': role,
      'category': '장소',
      'keyword': keyword,
      'turnOrder': [2, 1, 3],
    };

Map<String, dynamic> strokeJson([List<num> x = const [1, 2]]) => {
      'x': x,
      'y': [for (final v in x) v + 10],
      't': [for (var i = 0; i < x.length; i++) i * 10],
    };

Map<String, dynamic> sketchJson(int userId, {int strokes = 1}) => {
      'userId': userId,
      'canvas': {'w': 335, 'h': 425},
      'strokes': [for (var i = 0; i < strokes; i++) strokeJson()],
    };

Map<String, dynamic> turnJson({
  int round = 0,
  int turn = 0,
  int drawerId = 2,
  required int startedAt,
  required int drawFrom,
}) =>
    {
      'round': round,
      'turn': turn,
      'drawerId': drawerId,
      'startedAt': startedAt,
      'drawFrom': drawFrom,
      'deadline': drawFrom + 10000,
    };

Map<String, dynamic> roomFrame(
  Map<String, dynamic> phase, {
  bool isQuickStart = false,
  Map<String, dynamic>? rule,
}) =>
    {
      'type': 'ROOM',
      'data': {
        'room': {
          ...roomJson(players: threePlayersJson(), phase: phase, rule: rule),
          'isQuickStart': isQuickStart,
        },
      },
    };
