import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:x_pr/features/auth/data/sources/local_auth_source.dart';
import 'package:x_pr/features/auth/data/sources/remote_auth_source.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';

abstract interface class AuthRepository {
  static final $ = AutoDisposeProvider<AuthRepository>((ref) {
    return AuthRepositoryImpl(
      remoteAuthSource: ref.read(RemoteAuthSource.$),
      localAuthSource: ref.read(LocalAuthSource.$),
    );
  });

  Future<AuthState?> getAuthState();

  Future<Result<AuthState>> login(
    IdToken idToken,
    SignInMethod signInMethod,
  );

  Future<Result<void>> logout();

  Future<Result<Jwt>> refreshAccessToken(String refreshToken);
}
