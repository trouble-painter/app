import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/game/v1/data/repository/game_keyword_repository_impl.dart';
import 'package:x_pr/features/game/v1/data/source/game_keyword_dummy_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_keyword.dart';

abstract interface class GameKeywordRepository {
  static final $ = AutoDisposeProvider<GameKeywordRepository>((ref) {
    return GameKeywordRepositoryImpl(
      gameKeywordDummySource: ref.read(GameKeywordDummySource.$),
    );
  });

  Future<GameKeyword> random();
}
