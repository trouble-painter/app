part of '../game_state.dart';

class GameWaitingState extends GameState {
  final GameStep step = GameStep.waiting;
  final List<GameUser> userList;
  final String roomId;
  final int myId;
  final int hostIndex;
  final int minPlayer;
  final int maxPlayer;
  final GameRule rule;

  /// What a reset goes back to
  final int defaultStrokesPerTurn;

  /// The ones a host can pick for [rule]
  final List<GameCategory> categories;

  GameWaitingState({
    super.exception,
    required this.roomId,
    required this.userList,
    required this.myId,
    required this.hostIndex,
    required this.minPlayer,
    required this.maxPlayer,
    required this.rule,
    required this.defaultStrokesPerTurn,
    required this.categories,
  }) : super(isPlaying: false);

  bool get canStart => userList.length >= minPlayer;

  bool get isHost => myIndex == hostIndex;

  GameRule get initialRule => GameRule.initial(defaultStrokesPerTurn);

  /// In the order the server lists them. Empty means all categories.
  List<GameCategory> get selectedCategories {
    return categories.where((c) => rule.isSelected(c.id)).toList();
  }

  int get myIndex {
    try {
      return userList.indexWhere((user) => user.id == myId);
    } catch (_) {
      return -1;
    }
  }

  GameWaitingState copyWith({
    GameException? exception,
    List<GameUser>? userList,
    String? roomId,
    int? myId,
    int? hostIndex,
    int? minPlayer,
    int? maxPlayer,
    GameRule? rule,
  }) {
    return GameWaitingState(
      exception: exception,
      userList: userList ?? this.userList,
      roomId: roomId ?? this.roomId,
      myId: myId ?? this.myId,
      hostIndex: hostIndex ?? this.hostIndex,
      minPlayer: minPlayer ?? this.minPlayer,
      maxPlayer: maxPlayer ?? this.maxPlayer,
      rule: rule ?? this.rule,
      defaultStrokesPerTurn: defaultStrokesPerTurn,
      categories: categories,
    );
  }

  @override
  String toString() {
    return 'GameWaitingState(userList: $userList, roomId: $roomId, myId: $myId, hostIndex: $hostIndex, minPlayer: $minPlayer, maxPlayer: $maxPlayer, rule: $rule)';
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
