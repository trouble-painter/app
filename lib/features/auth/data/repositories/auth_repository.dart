import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trouble_painter/features/auth/data/sources/local_auth_source.dart';
import 'package:trouble_painter/features/auth/data/sources/remote_auth_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/auth_state.dart';
import 'package:trouble_painter/features/auth/domain/entities/id_token.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';

abstract interface class AuthRepository {
  static final $ = Provider.autoDispose<AuthRepository>((ref) {
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

  /// Reissue the access token and save the new [AuthState] to the secure storage.
  Future<Result<AuthState>> refreshAccessToken(AuthState authState);
}
