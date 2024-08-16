import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';

class OAuthGoogleSource {
  static final $ = AutoDisposeProvider<OAuthGoogleSource>((ref) {
    return OAuthGoogleSource();
  });

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: PlatformInfo.isAndroid
        ? Env.AOS_GOOGLE_CLIENT_ID
        : Env.IOS_GOOGLE_CLIENT_ID,
  );

  Future<Result<IdToken>> login() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final authentication = await googleSignInAccount?.authentication;
      final idToken = authentication?.idToken ?? "";
      return idToken.isEmpty
          ? const Failure("IdToken Cannot be null")
          : Success(idToken);
    } on PlatformException catch (e, s) {
      if (e.code == GoogleSignIn.kSignInCanceledError) {
        Logger.d("Google signIn canceled");
        return const Cancel();
      } else {
        Logger.e("Failed to signIn", e, s);
        return Failure(e);
      }
    } catch (e, s) {
      Logger.e("Failed to signIn", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> logout() async {
    try {
      await googleSignIn.signOut();
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to signOut", e, s);
      return Failure(e);
    }
  }
}
