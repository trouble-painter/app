import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_category.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_keyword.dart';

class GameAssigningPageState {
  final int myOrder;
  final bool isSpy;
  final bool isHost;
  final GameKeyword keyword;
  final GameCategory category;
  final List<GamePlayer> drawingOrder;

  GameAssigningPageState({
    required this.myOrder,
    required this.isSpy,
    required this.isHost,
    required this.keyword,
    required this.category,
    required this.drawingOrder,
  });

  GameAssigningPageState copyWith({
    int? myOrder,
    bool? isSpy,
    bool? isHost,
    GameKeyword? keyword,
    GameCategory? category,
    List<GamePlayer>? drawingOrder,
  }) {
    return GameAssigningPageState(
      myOrder: myOrder ?? this.myOrder,
      isSpy: isSpy ?? this.isSpy,
      isHost: isHost ?? this.isHost,
      keyword: keyword ?? this.keyword,
      category: category ?? this.category,
      drawingOrder: drawingOrder ?? this.drawingOrder,
    );
  }
}
