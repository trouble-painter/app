import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/auth/data/repositories/auth_repository.dart';
import 'package:x_pr/features/auth/data/repositories/o_auth_repository.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';

class SignOutUsecase implements BaseUsecase<AuthState, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<SignOutUsecase>((ref) {
    return SignOutUsecase(
      authRepository: ref.read(AuthRepository.$),
      oAuthRepository: ref.read(OAuthRepository.$),
    );
  });

  final AuthRepository authRepository;
  final OAuthRepository oAuthRepository;
  const SignOutUsecase({
    required this.authRepository,
    required this.oAuthRepository,
  });

  @override
  Future<Result<void>> call(AuthState authState) async {
    return switch (await authRepository.logout()) {
      Success() => oAuthRepository.logout(authState.signInMethod),
      Failure() => const Failure(),
      Cancel() => const Cancel(),
    };
  }
}
