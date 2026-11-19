import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/auth/data/sources/remote_auth_source.dart';
import 'package:trouble_painter/features/game/domain/usecases/connect_usecase.dart';

import '../helpers/test_env.dart';

/// Lets Riverpod dispose providers nobody listens to.
Future<void> settle() => Future<void>.delayed(Duration.zero);

void main() {
  setUpAll(loadTestEnv);

  late ProviderContainer container;
  setUp(() => container = ProviderContainer());
  tearDown(() => container.dispose());

  /// Long-lived objects keep these instances and call their getters later.
  test('RemoteAuthSource reads the config after the read that made it',
      () async {
    final source = container.read(RemoteAuthSource.$);
    await settle();
    expect(source.getUrl('/api'), endsWith('/api'));
  });

  test('ConnectUsecase reads the socket url after the read that made it',
      () async {
    final usecase = container.read(ConnectUsecase.$);
    await settle();
    expect(usecase.getBaseSocketUrl().toString(), isNotEmpty);
  });
}
