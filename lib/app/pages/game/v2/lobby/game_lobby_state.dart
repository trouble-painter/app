class GameLobbyState {
  final String uuid;
  final String nickname;
  final bool isBusy;

  const GameLobbyState({
    required this.uuid,
    required this.nickname,
    this.isBusy = false,
  });

  GameLobbyState copyWith({
    String? uuid,
    String? nickname,
    bool? isBusy,
  }) {
    return GameLobbyState(
      uuid: uuid ?? this.uuid,
      nickname: nickname ?? this.nickname,
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
