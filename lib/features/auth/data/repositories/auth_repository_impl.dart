import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/data/repositories/auth_repository.dart';
import 'package:x_pr/features/auth/data/sources/local_auth_source.dart';
import 'package:x_pr/features/auth/data/sources/remote_auth_source.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';

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
  Future<Result<Jwt>> refreshAccessToken(refreshToken) {
    return remoteAuthSource.reissue(refreshToken);
  }
}
