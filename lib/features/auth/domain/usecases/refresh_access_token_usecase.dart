import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/auth/data/repositories/auth_repository.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';

enum RefreshAccessTokenException {
  unauthenticated;
}

class RefreshAccessTokenParam {
  final String refreshToken;

  RefreshAccessTokenParam({required this.refreshToken});
}

class RefreshAccessTokenUsecase
    implements BaseUsecase<RefreshAccessTokenParam, Future<Result<Jwt>>> {
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
  Future<Result<Jwt>> call(RefreshAccessTokenParam param) {
    return authRepository.refreshAccessToken(param.refreshToken);
  }
}
