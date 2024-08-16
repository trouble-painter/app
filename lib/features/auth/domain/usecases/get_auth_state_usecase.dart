import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/auth/data/repositories/auth_repository.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';

class GetAuthStateUsecase implements BaseUsecase<void, Future<AuthState?>> {
  static final $ = AutoDisposeProvider<GetAuthStateUsecase>((ref) {
    return GetAuthStateUsecase(
      authRepository: ref.read(AuthRepository.$),
    );
  });

  final AuthRepository authRepository;
  const GetAuthStateUsecase({
    required this.authRepository,
  });

  @override
  Future<AuthState?> call(void params) {
    return authRepository.getAuthState();
  }
}
