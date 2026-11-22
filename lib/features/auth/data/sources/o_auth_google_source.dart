import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/utils/env/env.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/platform/platform_info.dart';
import 'package:trouble_painter/features/auth/domain/entities/id_token.dart';

class OAuthGoogleSource {
  static final $ = Provider.autoDispose<OAuthGoogleSource>((ref) {
    return OAuthGoogleSource();
  });

  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  /// Must complete once before any other [GoogleSignIn] call.
  late final Future<void> _initialized = googleSignIn.initialize(
    clientId: PlatformInfo.isAndroid ? null : Env.IOS_GOOGLE_CLIENT_ID,
    serverClientId: PlatformInfo.isAndroid ? Env.AOS_GOOGLE_CLIENT_ID : null,
  );

  Future<Result<IdToken>> login() async {
    try {
      await _initialized;
      final googleSignInAccount = await googleSignIn.authenticate();
      final idToken = googleSignInAccount.authentication.idToken ?? "";
      return idToken.isEmpty
          ? const Failure("IdToken Cannot be null")
          : Success(idToken);
    } on GoogleSignInException catch (e, s) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
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
      await _initialized;
      await googleSignIn.signOut();
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to signOut", e, s);
      return Failure(e);
    }
  }
}
