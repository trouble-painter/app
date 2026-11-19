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
      'strokesPerTurn': 1,
      'voteMs': 30000,
      'answerMs': 20000,
      'endMs': 15000,
    };

Map<String, dynamic> roomJson({
  int hostId = 1,
  List<Map<String, dynamic>>? players,
  Map<String, dynamic> phase = const {'type': 'WAIT'},
}) =>
    {
      'id': 'K7Q2ZP',
      'locale': 'KO',
      'isQuickStart': false,
      'hostId': hostId,
      'players': players ?? [playerJson(1), playerJson(2, color: 'ORANGE')],
      'option': optionJson(),
      'phase': phase,
    };

Map<String, dynamic> limitsJson() => {
      'drawThrottleMs': 50,
      'reactionThrottleMs': 500,
      'maxStrokePoints': 500,
      'maxAnswerLength': 20,
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
