import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/app/pages/join/join_page_state.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/auth/domain/services/auth_service.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class JoinPageModel extends BaseViewModel<JoinPageState> {
  JoinPageModel(super.buildState);

  BuildContext get context => ref.read(RoutesSetting.$).context;
  Future<bool> get hasStringsInClipbaord => Clipboard.hasStrings();
  Config get config => ref.read(ConfigService.$);
  AuthServiceState get authServiceState => ref.read(AuthService.$);
  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  /// Allows only English letters and numbers, and notifies when anything else is entered.
  late final List<TextInputFormatter> inputFormatters = [
    _InvitationCodeFormatter(onRejected: notifyInvalidCharacters),
  ];

  void notifyInvalidCharacters() {
    analyticsService.sendEvent(JoinPageInvalidInputEvent());
    Toast.showText(S.current.joinInvalidCharacters);
  }

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

      if (!_InvitationCodeFormatter.allowed.hasMatch(invitationCode)) {
        notifyInvalidCharacters();
        return;
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

class _InvitationCodeFormatter extends TextInputFormatter {
  _InvitationCodeFormatter({required this.onRejected});

  static final allowed = RegExp(r'^[a-zA-Z0-9]*$');
  static final _rejected = RegExp(r'[^a-zA-Z0-9]');

  final VoidCallback onRejected;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (allowed.hasMatch(newValue.text)) return newValue;
    onRejected();
    final text = newValue.text.replaceAll(_rejected, '');
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
