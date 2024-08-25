import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/join/join_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

abstract class JoinPageModel extends BaseViewModel<JoinPageState> {
  JoinPageModel(super.buildState);

  BuildContext get context => ref.read(RoutesSetting.$).context;
  Future<bool> get hasStringsInClipbaord => Clipboard.hasStrings();
  Config get config => ref.read(ConfigService.$);
  AuthServiceState get authServiceState => ref.read(AuthService.$);
  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void onChange(String value) {
    state.controller.text = value.toUpperCase();
  }

  void focus() {
    state.focusNode.requestFocus();
  }

  Future<void> pasteFromClipboard() async {
    /// Send event
    analyticsService.sendEvent(JoinPagePasteClickEvent());

    final clipboardData = await Clipboard.getData("text/plain");
    final text = clipboardData?.text;
    if (text != null) {
      String invitationCode = text;

      /// Extract invitation code from [CODE]
      /// Invitation message format : S.current.gameWaitingInviteMessage
      if (text.length > state.invitationCodeLength) {
        final Match? match = RegExp(r'\[([^\]]+)\]').firstMatch(text);
        if (match != null) {
          invitationCode = match.group(1)!;
        }
      }

      if (invitationCode.length == state.invitationCodeLength) {
        state.controller.text = invitationCode;
        return;
      } else {
        Toast.showText(S.current.joinCheckRoomId);
        return;
      }
    }
  }

  Future<bool> joinRoom();

  Future<void> onPinCodeComplete(String text) async {
    if (state.isBusy) return;
    if (text.length != state.invitationCodeLength) {
      focus();
    } else {
      state.focusNode.unfocus();
      if (await joinRoom()) {
        goToJoinPage();
      }
    }
  }

  Future<void> joinPressed() async {
    if (state.isBusy) return;

    /// Send event
    analyticsService.sendEvent(JoinPageSubmitEvent());

    if (await joinRoom()) {
      goToJoinPage();
    }
  }

  void goToJoinPage() {
    if (!context.mounted) return;
    context.pushReplacementNamed(Routes.gamePage.name);
  }

  void onBackPressed() {
    /// Send event
    analyticsService.sendEvent(JoinPageBackClickEvent());
  }
}
