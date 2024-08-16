part of '../../x_game_res.dart';

class XGameWaitingPhase extends XGamePhase {
  final String roomId;
  final List<XGameUser> players;

  XGameWaitingPhase({
    required this.roomId,
    required this.players,
  }) : super(type: XGamePhaseType.waiting);

  factory XGameWaitingPhase.fromJson(Map<String, dynamic> json) {
    return XGameWaitingPhase(
      roomId: json['roomId'] ?? '',
      players: (json['players'] ?? [])
          .map<XGameUser>((u) => XGameUser.fromJson(u))
          .toList(),
    );
  }

  @override
  GameWaitingState toEntity(int myId) => GameWaitingState(
        roomId: roomId,
        userList: players.map((xUser) => xUser.toEntity()).toList(),
        myId: myId,
        hostIndex: players.indexWhere((u) => u.isOwner),
        minPlayer: Constant.minPlayer,
        maxPlayer: Constant.maxPlayer,
      );
  @override
  String toString() => 'XGameWaitingPhase(roomId: $roomId, players: $players)';
}
