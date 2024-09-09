import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';
import 'package:x_pr/features/config/domain/usecases/change_language_usecase.dart';
import 'package:x_pr/features/config/domain/usecases/clear_local_storage_usecase.dart';
import 'package:x_pr/features/config/domain/usecases/init_config_usecase.dart';
import 'package:x_pr/features/config/domain/usecases/save_config_usecase.dart';

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

  void _emit(Config config) {
    Logger.isEnabled = config.isDeveloper;
    state = config;
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
    state = config;
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
