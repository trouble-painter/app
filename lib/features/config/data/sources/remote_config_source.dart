import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/firebase_remote_config_source.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/utils/ext/num_ext.dart';
import 'package:x_pr/core/utils/ext/string_ext.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/log/webhook/webhook.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_admob_id.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_maintenance_dialog_data.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_min_build_number.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_notice_dialog_data.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_update_dialog_data.dart';

class RemoteConfigSource {
  static final $ = AutoDisposeProvider<RemoteConfigSource>((ref) {
    return RemoteConfigSource(
      remoteConfig: ref.read(FirebaseRemoteConfigSource.$),
      webhook: ref.read(Webhook.$),
    );
  });

  const RemoteConfigSource({
    required FirebaseRemoteConfig remoteConfig,
    required this.webhook,
  }) : _rc = remoteConfig;

  final FirebaseRemoteConfig _rc;
  final Webhook webhook;

  Future<void> init() async {
    try {
      await _rc.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(
            seconds: 10,
          ),
          minimumFetchInterval: const Duration(
            seconds: kDebugMode ? 10 : 12 * 3600,
          ),
        ),
      );

      /// https://github.com/firebase/flutterfire/issues/6196#issuecomment-927751667
      await Future.delayed(const Duration(seconds: 1));
      await _rc.fetchAndActivate();
    } catch (e, s) {
      Logger.e("Failed to init remote config", e, s);
      webhook.sendError("Failed to init remote config", e, s);
    }
  }

  RemoteConfig get() {
    return RemoteConfig(
      /// App
      aosAppId: _rc.getString("aosAppId"),
      iosAppId: _rc.getString("iosAppId"),

      /// Urls
      privacyPolicyUrl: RemoteConfigLang.fromJsonString(
        _rc.getString('privacyPolicyUrl'),
      ),
      termsOfServiceUrl: RemoteConfigLang.fromJsonString(
        _rc.getString('termsOfServiceUrl'),
      ),
      noticeUrl: RemoteConfigLang.fromJsonString(
        _rc.getString('noticeUrl'),
      ),
      suggestKeywordsUrl: RemoteConfigLang.fromJsonString(
        _rc.getString('suggestKeywordsUrl'),
      ),
      baseUrl: _rc.getString('baseUrl').ifEmpty(
            Env.BASE_URL,
          ),
      baseSocketUrl: _rc.getString('baseSocketUrl').ifEmpty(
            Env.BASE_SOCKET_URL,
          ),
      inviteUrl: _rc.getString('inviteUrl').ifEmpty(
            Env.INVITE_URL,
          ),
      instagramUrl: _rc.getString('instagramUrl'),
      discordUrl: _rc.getString('discordUrl'),

      /// Webhooks
      errorWebHookUrl: _rc.getString('errorWebHookUrl').ifEmpty(
            Env.ERROR_WEBHOOK_URL,
          ),
      quickStartWebHookUrl: _rc.getString('quickStartWebHookUrl'),
      quickStartWebHookWaitingSec:
          _rc.getInt('quickStartWebHookWaitingSec').ifZeroOrLess(1000000),
      isQuickStartWebHook: _rc.getBool('isQuickStartWebHook'),

      /// Settings
      maxDrawingPoints: _rc.getInt('maxDrawingPoints').clamp(0, 100000),
      maxGuessLength: _rc.getInt('maxGuessLength').ifZeroOrLess(100),
      drawingThrottleMs: _rc.getInt('drawingThrottleMs').clamp(0, 1000),
      waitingBgSocketTimeOut:
          _rc.getInt('waitingBgSocketTimeOut').ifZeroOrLess(60),
      playingBgSocketTimeOut:
          _rc.getInt('playingBgSocketTimeOut').ifZeroOrLess(60),
      drawOptimizeEpsilion: _rc.getDouble('drawOptimizeEpsilion').clamp(
            0.0,
            1.0,
          ),

      /// Bgm
      bgmUrl: _rc.getString('bgmUrl'),
      gameBgmUrl: _rc.getString('gameBgmUrl'),
      isBgmDisabled: _rc.getBool('isBgmDisabled'),
      isGameBgmDisabled: _rc.getBool('isGameBgmDisabled'),
      bgmLicenseUrl: RemoteConfigLang.fromJsonString(
        _rc.getString('bgmLicenseUrl'),
      ),

      /// Gemini
      geminiApiKey: _rc.getString('geminiApiKey'),
      geminiModel: _rc.getString('geminiModel'),
      isGeminiHint: _rc.getBool('isGeminiHint'),
      geminiHintPrompt: RemoteConfigLang.fromJsonString(
        _rc.getString('geminiHintPrompt'),
      ),

      /// Operations
      minBuildNumber: RemoteConfigMinBuildNumber.fromJsonString(
        _rc.getString('minBuildNumber'),
      ),
      updateDialogData: RemoteConfigUpdateDialogData.fromJsonString(
        _rc.getString('updateDialog'),
      ),
      noticeDialogData: RemoteConfigNoticeDialogData.fromJsonString(
        _rc.getString('noticeDialog'),
      ),
      contactUsEmail: _rc.getString('contactUsEmail'),
      maintenanceDialogData: RemoteConfigMaintenanceDialogData.fromJsonString(
        _rc.getString('maintenanceDialog'),
      ),

      /// Admob
      admobAppId: RemoteConfigAdmobId.fromJsonString(
        _rc.getString('admobAppId'),
      ),
      admobQuickStartRewardId: RemoteConfigAdmobId.fromJsonString(
        _rc.getString('admobQuickStartRewardId'),
      ),

      /// Developers
      devUuidList: List<String>.from(
        jsonDecode(
          _rc.getString('devUuidList').ifEmpty('[]'),
        ),
      ),
    );
  }

  Stream<RemoteConfig> onUpdate() {
    return _rc.onConfigUpdated.transform(
      StreamTransformer.fromHandlers(
        handleData: (configUpdate, sink) async {
          await _rc.activate();
          final updatedKeys = configUpdate.updatedKeys.join(" / ");
          Logger.d(
            '${Constant.eRemoteConfig} RemoteConfig Updated : $updatedKeys',
          );
          sink.add(get());
        },
      ),
    );
  }
}
