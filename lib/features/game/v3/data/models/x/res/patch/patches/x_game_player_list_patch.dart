part of '../../x_game_res.dart';

class XGamePlayerListPatch extends XGamePatch {
  final List<XGameUser> users;

  XGamePlayerListPatch({
    required this.users,
  }) : super(type: XGamePatchType.playerList);

  factory XGamePlayerListPatch.fromJson(Map<String, dynamic> json) {
    return XGamePlayerListPatch(
      users: (json['players'] ?? [])
          .map<XGameUser>((u) => XGameUser.fromJson(u))
          .toList(),
    );
  }

  @override
  GameState call(GameState state) {
    return switch (state) {
      GameWaitingState() => state.copyWith(
          userList: users.map((xUser) => xUser.toEntity()).toList(),
          hostIndex: users.indexWhere((xUser) => xUser.isOwner),
        ),
      GameDrawingState() => state.copyWith(
          userList: users.map((xUser) => xUser.toEntity()).toList(),
        ),
      _ => state,
    };
  }
}
