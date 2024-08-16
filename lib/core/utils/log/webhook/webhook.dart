import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/dio_source.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class Webhook {
  static final $ = Provider<Webhook>((ref) {
    return Webhook(
      dio: ref.read(DioSource.$),
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  Webhook({
    required Dio dio,
    required Config Function() getConfig,
  })  : _dio = dio,
        _getConfig = getConfig;

  final Dio _dio;
  final Config Function() _getConfig;
  Config get config => _getConfig();

  void sendError(String message, Object e, StackTrace s) async {
    final List<String> stackLines = s.toString().split('\n');
    final String truncatedStackTrace = stackLines.take(6).join('\n');

    final data = {
      'embeds': [
        {
          'title': '🔴 $message | $e',
          'description': '```$truncatedStackTrace```',
          'color': 15158332,
        }
      ],
    };

    try {
      await _dio.post(
        config.discordWebHookUrl.toString(),
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e, s) {
      Logger.e('Failed to sendError', e, s);
    }
  }
}
