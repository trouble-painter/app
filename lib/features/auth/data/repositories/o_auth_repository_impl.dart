import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/auth/data/repositories/o_auth_repository.dart';
import 'package:x_pr/features/auth/data/sources/o_auth_apple_source.dart';
import 'package:x_pr/features/auth/data/sources/o_auth_google_source.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';

class OAuthRepositoryImpl implements OAuthRepository {
  final OAuthAppleSource oauthAppleSource;
  final OAuthGoogleSource oauthGoogleSource;
  const OAuthRepositoryImpl({
    required this.oauthAppleSource,
    required this.oauthGoogleSource,
  });

  @override
  Future<Result<IdToken>> login(SignInMethod signInMethod) async {
    return switch (signInMethod) {
      SignInMethod.google => await oauthGoogleSource.login(),
      SignInMethod.apple => await oauthAppleSource.login(),
      SignInMethod.anonymous => const Success(""),
    };
  }

  @override
  Future<Result<void>> logout(SignInMethod signInMethod) async {
    return switch (signInMethod) {
      SignInMethod.google => await oauthGoogleSource.logout(),
      SignInMethod.apple => await oauthAppleSource.logout(),
      SignInMethod.anonymous => const Success(""),
    };
  }
}
