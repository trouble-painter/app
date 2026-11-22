import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/auth/data/repositories/auth_repository.dart';
import 'package:trouble_painter/features/auth/domain/entities/auth_state.dart';

enum RefreshAccessTokenException {
  unauthenticated,

  /// The server rejected the refresh token (4xx). Sign in again.
  rejected;
}

class RefreshAccessTokenParam {
  final AuthState authState;

  RefreshAccessTokenParam({required this.authState});
}

class RefreshAccessTokenUsecase
    implements BaseUsecase<RefreshAccessTokenParam, Future<Result<AuthState>>> {
  static final $ = Provider.autoDispose<RefreshAccessTokenUsecase>((ref) {
    return RefreshAccessTokenUsecase(
      authRepository: ref.read(AuthRepository.$),
    );
  });

  RefreshAccessTokenUsecase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  Future<Result<AuthState>> call(RefreshAccessTokenParam param) {
    return authRepository.refreshAccessToken(param.authState);
  }
}
