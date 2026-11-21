import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/data/sources/dio_source.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/auth/data/sources/auth_dio_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class RemoteGameSource {
  static final $ = Provider<RemoteGameSource>((ref) {
    return RemoteGameSource(
      authDio: ref.read(AuthDioSource.$),
      dio: ref.read(DioSource.$),
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  const RemoteGameSource({
    required Dio authDio,
    required Dio dio,
    required Config Function() getConfig,
  })  : _getConfig = getConfig,
        _dio = authDio,
        _publicDio = dio;

  final Dio _dio;

  /// For endpoints that need no token
  final Dio _publicDio;
  final Config Function() _getConfig;
  String _getUrl(String path) => _getConfig().baseUrl.resolve(path).toString();

  Future<Result<String?>> getPlayingRoomId(Jwt jwt) async {
    try {
      final result = await _dio.get(_getUrl("api/v1/playing-room"));
      final String? roomId = result.data["roomId"];
      return Success(roomId);
    } catch (e, s) {
      Logger.e("Failed to getPlayingRoomid", e, s);
      return Failure(e);
    }
  }

  Future<Result<int>> getRoomCodeLength() async {
    try {
      final result = await _publicDio.get(_getUrl("api/v1/config"));
      final int length = result.data["roomCodeLength"];
      return Success(length);
    } catch (e, s) {
      Logger.e("Failed to getRoomCodeLength", e, s);
      return Failure(e);
    }
  }
}
