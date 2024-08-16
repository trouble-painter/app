import 'package:x_pr/features/game/v1/data/repository/game_keyword_repository.dart';
import 'package:x_pr/features/game/v1/data/source/game_keyword_dummy_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_keyword.dart';

class GameKeywordRepositoryImpl implements GameKeywordRepository {
  final GameKeywordDummySource gameKeywordDummySource;

  GameKeywordRepositoryImpl({
    required this.gameKeywordDummySource,
  });

  @override
  Future<GameKeyword> random() async {
    return gameKeywordDummySource.random();
  }
}
