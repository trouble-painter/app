import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/data/repositories/o_auth_repository_impl.dart';
import 'package:trouble_painter/features/auth/data/sources/o_auth_apple_source.dart';
import 'package:trouble_painter/features/auth/data/sources/o_auth_google_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/id_token.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';

abstract interface class OAuthRepository {
  static final $ = Provider.autoDispose<OAuthRepository>((ref) {
    return OAuthRepositoryImpl(
      oauthGoogleSource: ref.read(OAuthGoogleSource.$),
      oauthAppleSource: ref.read(OAuthAppleSource.$),
    );
  });

  Future<Result<IdToken>> login(SignInMethod signInMethod);

  Future<Result<void>> logout(SignInMethod signInMethod);
}
