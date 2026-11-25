import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/platform/platform_info.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/entities/notice_dialog_history.dart';
import 'package:trouble_painter/features/config/domain/usecases/change_language_usecase.dart';
import 'package:trouble_painter/features/config/domain/usecases/check_developer_usecase.dart';
import 'package:trouble_painter/features/config/domain/usecases/clear_local_storage_usecase.dart';
import 'package:trouble_painter/features/config/domain/usecases/init_config_usecase.dart';
import 'package:trouble_painter/features/config/domain/usecases/save_config_usecase.dart';

class ConfigService extends Notifier<Config> {
  static final $ = NotifierProvider<ConfigService, Config>(
    ConfigService.new,
  );

  bool get isKo => state.language == Language.korean;

  @override
  Config build() {
    return Config.init();
  }

  Future<void> init() async {
    final defaultLanguage = ref.read(PlatformInfo.$).language;
    const defaultisLightTheme = false;
    final param = InitConfigParam(
      defaultisLightTheme: defaultisLightTheme,
      defaultLanguage: defaultLanguage,
    );
    final result = await ref.read(InitConfigUsecase.$).call(param);
    _emit(result.config);

    /// Load locale
    S.load(state.language.locale);

    /// Listen config update
    final streamSubs = result.stream.listen(_emit);
    ref.onDispose(streamSubs.cancel);
  }

  /// Configs rebuilt from storage know nothing of the in-memory developer
  /// activation, so it is carried over unless a new value is given.
  void _emit(Config config, {bool? isDeveloperActivated}) {
    final next = config.copyWith(
      isDeveloperActivated: isDeveloperActivated ?? state.isDeveloperActivated,
    );
    Logger.isEnabled = next.isDeveloper;
    state = next;
  }

  /// Asks the server whether this device is a developer's and, if so, turns
  /// the developer menu on until the app restarts.
  Future<Result<bool>> activateDeveloper() async {
    final result = await ref.read(CheckDeveloperUsecase.$).call(
          CheckDeveloperParam(baseUrl: state.baseUrl, uuid: state.uuid),
        );
    if (result case Success(value: true)) {
      _emit(state, isDeveloperActivated: true);
    }
    return result;
  }

  Future<Result<void>> updateIsQuickStartFirstRun() async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            isQuickStartFirstRun: false,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> clearLocalStorage() async {
    final result = await ref.read(ClearLocalStorageUsecase.$).call(null);
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> toggleTheme() async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            isLightTheme: !state.isLightTheme,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> changeLanguage(Language language) async {
    if (state.language == language) {
      return const Cancel();
    }
    final config = await ref.read(ChangeLanguageUsecase.$).call(
          ChangeLanguageUsecaseParam(language),
        );
    _emit(config);
    S.load(state.language.locale);
    return const Success(null);
  }

  Future<Result<void>> toggleBgmMute() async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            isBgmMute: !state.isBgmMute,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> toggleUiTestMode() async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            isUiTestMode: !state.isUiTestMode,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> toggleUiTestModeMark() async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            isUiTestModeMark: !state.isUiTestModeMark,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> updateNickname(String nickname) async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            nickname: nickname,
            isFirstRun: false,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> updateReceiveQuickStartNoti(bool isReceive) async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            notificationSetting: state.notificationSetting.copyWith(
              receiveQuickStartNoti: isReceive,
            ),
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> updateLastInAppReviewRequestedAt(
    DateTime requestedAt,
  ) async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            lastInAppReviewRequestedAt: requestedAt,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }

  Future<Result<void>> saveNoticeDialogHistory(
    NoticeDialogHistory history,
  ) async {
    final result = await ref.read(SaveConfigUsecase.$).call(
          state.copyWith(
            noticeDialogHistory: history,
          ),
        );
    return switch (result) {
      Success(value: Config config) => (state = config, result).$2,
      _ => result,
    };
  }
}
