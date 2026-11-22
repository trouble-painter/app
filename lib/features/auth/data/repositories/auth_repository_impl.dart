import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/data/repositories/auth_repository.dart';
import 'package:trouble_painter/features/auth/data/sources/local_auth_source.dart';
import 'package:trouble_painter/features/auth/data/sources/remote_auth_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/auth_state.dart';
import 'package:trouble_painter/features/auth/domain/entities/id_token.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthSource localAuthSource;
  final RemoteAuthSource remoteAuthSource;
  const AuthRepositoryImpl({
    required this.localAuthSource,
    required this.remoteAuthSource,
  });

  @override
  Future<AuthState?> getAuthState() async {
    return await localAuthSource.read();
  }

  @override
  Future<Result<AuthState>> login(
    IdToken idToken,
    SignInMethod signInMethod,
  ) async {
    return switch (await remoteAuthSource.signIn(idToken, signInMethod)) {
      Success(value: Jwt jwt) => await localAuthSource.write(
          AuthState(
            jwt: jwt,
            idToken: idToken,
            signInMethod: signInMethod,
          ),
        ),
      Failure(e: Object? e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }

  @override
  Future<Result<void>> logout() async {
    return switch (await remoteAuthSource.signOut()) {
      Success() => await localAuthSource.delete(),
      Failure() => const Failure(),
      Cancel() => const Cancel(),
    };
  }

  @override
  Future<Result<AuthState>> refreshAccessToken(AuthState authState) async {
    return switch (await remoteAuthSource.reissue(authState.jwt.refreshToken)) {
      Success(value: Jwt jwt) =>
        await localAuthSource.write(authState.copyWith(jwt: jwt)),
      Failure(e: Object? e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }
}
