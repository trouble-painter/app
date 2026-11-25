import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/config/data/repositories/config_repository.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

import '../../../../helpers/test_env.dart';

class _FakeConfigRepository extends Fake implements ConfigRepository {
  _FakeConfigRepository({required this.isDeveloper});

  final bool isDeveloper;

  @override
  Future<Result<bool>> checkDeveloper({
    required Uri baseUrl,
    required String uuid,
  }) async {
    return Success(isDeveloper);
  }
}

void main() {
  setUpAll(loadTestEnv);

  /// [Config.isDeveloper] is always true in a debug run, so the tests check the
  /// activation itself.
  Future<bool> activate({required bool isDeveloper}) async {
    final container = ProviderContainer(
      overrides: [
        ConfigRepository.$.overrideWithValue(
          _FakeConfigRepository(isDeveloper: isDeveloper),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container.read(ConfigService.$.notifier).activateDeveloper();
    return container.read(ConfigService.$).isDeveloperActivated;
  }

  test('activateDeveloper turns the developer menu on for a developer',
      () async {
    expect(await activate(isDeveloper: true), isTrue);
  });

  test('activateDeveloper leaves the developer menu off for others', () async {
    expect(await activate(isDeveloper: false), isFalse);
  });
}
