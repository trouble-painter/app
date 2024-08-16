import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/auth/data/repositories/auth_repository.dart';
import 'package:x_pr/features/auth/data/repositories/o_auth_repository.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';

class SignInUsecase
    implements BaseUsecase<SignInMethod, Future<Result<AuthState>>> {
  static final $ = AutoDisposeProvider<SignInUsecase>((ref) {
    return SignInUsecase(
      authRepository: ref.read(AuthRepository.$),
      oAuthRepository: ref.read(OAuthRepository.$),
    );
  });

  final AuthRepository authRepository;
  final OAuthRepository oAuthRepository;
  const SignInUsecase({
    required this.authRepository,
    required this.oAuthRepository,
  });

  @override
  Future<Result<AuthState>> call(SignInMethod signInMethod) async {
    return switch (await oAuthRepository.login(signInMethod)) {
      Success(value: IdToken idToken) => await authRepository.login(
          idToken,
          signInMethod,
        ),
      Failure(e: Object? e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }
}
