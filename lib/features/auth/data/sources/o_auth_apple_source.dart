import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';

class OAuthAppleSource {
  static final $ = AutoDisposeProvider((ref) {
    return OAuthAppleSource();
  });

  Future<Result<IdToken>> login() async {
    try {
      final credentialAppleID = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final idToken = credentialAppleID.identityToken ?? "";
      return idToken.isEmpty
          ? const Failure("IdToken Cannot be null")
          : Success(idToken);
    } on SignInWithAppleAuthorizationException catch (e, s) {
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          Logger.d('Apple signIn canceled');
          return const Cancel();
        case AuthorizationErrorCode.failed:
        case AuthorizationErrorCode.invalidResponse:
        case AuthorizationErrorCode.notHandled:
        case AuthorizationErrorCode.notInteractive:
        case AuthorizationErrorCode.unknown:
          Logger.e('Failed to signIn', e, s);
          return Failure(e);
      }
    } catch (e, s) {
      Logger.e('Failed to signIn', e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> logout() async {
    /// issue : https://github.com/aboutyou/dart_packages/issues/84
    return const Success(null);
  }
}
