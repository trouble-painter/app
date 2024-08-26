import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/dio_source.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

/// Discord webhook color
/// - https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812
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
    Logger.d("🥊 sendError : $message");
    final List<String> stackLines = s.toString().split('\n');
    final String truncatedStackTrace = stackLines.take(6).join('\n');

    final data = {
      'embeds': [
        {
          'title': '🔴 $message | $e',
          'description': '```uuid : ${config.uuid}\n$truncatedStackTrace```',
          'color': 15158332, // Red
        }
      ],
    };

    try {
      await _dio.post(
        config.errorWebHookUrl.toString(),
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

  Future<String?> sendQuickStartWaiting(
    String nickname,
    Language language,
  ) async {
    if (!config.isQuickStartWebHook) return null;
    Logger.d("🥊 sendQuickStart : $nickname / $language");
    final data = {
      'embeds': [
        {
          'title':
              '${language.isKorean ? "🇰🇷" : "🇺🇸"} $nickname님이 빠른 게임 상대를 기다리고 있어요.',
          'color': 15105570, // Orange
        }
      ],
    };

    try {
      final uri = config.quickStartWebHookUrl;
      final result = await _dio.post(
        uri.replace(
          queryParameters: {
            'wait': 'true', // Get message id
          },
        ).toString(),
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return result.data['id'].toString();
    } catch (e, s) {
      Logger.e('Failed to sendQuickStart', e, s);
      return null;
    }
  }

  Future<void> deleteQuickStartWaiting(String messageId) async {
    if (!config.isQuickStartWebHook) return;
    try {
      final uri = config.quickStartWebHookUrl;
      final result = await _dio.delete(
        (uri.path.endsWith('/') ? uri : uri.replace(path: '${uri.path}/'))
            .resolve("messages/$messageId")
            .toString(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      Logger.d("delete result : $result");
    } catch (e, s) {
      Logger.e('Failed to deleteQuickStartWaiting', e, s);
    }
  }
}
