import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trouble_painter/features/auth/data/sources/local_auth_source.dart';
import 'package:trouble_painter/features/auth/data/sources/remote_auth_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/auth_state.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';

class _FakeRemote extends RemoteAuthSource {
  _FakeRemote(this.result)
      : super(dio: Dio(), getConfig: () => throw UnimplementedError());
  final Result<Jwt> result;

  @override
  Future<Result<Jwt>> reissue(String refreshToken) async => result;
}

class _FakeLocal extends LocalAuthSource {
  _FakeLocal() : super(secureStorage: const FlutterSecureStorage());
  AuthState? written;

  @override
  Future<Result<AuthState>> write(AuthState authState) async {
    written = authState;
    return Success(authState);
  }
}

void main() {
  final oldState = AuthState(
    jwt: Jwt(userId: 1, refreshToken: 'refresh', accessToken: 'old'),
    idToken: '',
    signInMethod: SignInMethod.anonymous,
  );

  group('AuthRepositoryImpl.refreshAccessToken', () {
    test('saves the reissued jwt', () async {
      final newJwt =
          Jwt(userId: 1, refreshToken: 'refresh', accessToken: 'new');
      final local = _FakeLocal();
      final repository = AuthRepositoryImpl(
        localAuthSource: local,
        remoteAuthSource: _FakeRemote(Success(newJwt)),
      );

      final result = await repository.refreshAccessToken(oldState);

      expect(local.written, oldState.copyWith(jwt: newJwt));
      expect((result as Success<AuthState>).value.jwt, newJwt);
    });

    test('saves nothing on failure', () async {
      final local = _FakeLocal();
      final repository = AuthRepositoryImpl(
        localAuthSource: local,
        remoteAuthSource: _FakeRemote(const Failure('error')),
      );

      final result = await repository.refreshAccessToken(oldState);

      expect(result, isA<Failure<AuthState>>());
      expect(local.written, isNull);
    });
  });
}
