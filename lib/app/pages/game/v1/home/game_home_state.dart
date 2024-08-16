class GameHomeState {
  final String uid;
  final String nickname;
  final bool isBusy;

  const GameHomeState({
    required this.uid,
    required this.nickname,
    this.isBusy = false,
  });

  GameHomeState copyWith({
    String? uid,
    String? nickname,
    bool? isBusy,
  }) {
    return GameHomeState(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
