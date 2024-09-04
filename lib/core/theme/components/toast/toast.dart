import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

import '../../foundations/app_theme.dart';

part 'custom_toast/custom_toast_builder.dart';
part 'spinner_toast/spinner_toast_builder.dart';
part 'text_toast/text_toast_builder.dart';
part 'text_toast/text_toast_type.dart';
part 'toast_type.dart';

typedef _Texts = Map<GlobalKey<TextToastBuilderState>, OverlayEntry>;

abstract class Toast {
  static GlobalKey<NavigatorState>? navigatorKey;

  /// Add overlay entry to root
  static Widget init(Widget? child) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => child ?? const SizedBox(),
          ),
        ],
      );

  /// Dismiss current toast
  static void dismiss(ToastType type) {
    switch (type) {
      case ToastType.text:
        for (final toastKey in _textToastMap.keys) {
          toastKey.currentState?.isShow = false;
        }
        break;
      case ToastType.spinner:
        _spinnerKey.currentState?.dismiss(_spinnerOverlay!.remove);
        _spinnerOverlay = null;
        break;
      case ToastType.custom:
        _customKey.currentState?.dismiss(_customOverlay!.remove);
        _customOverlay = null;
        break;
    }
  }

  /// Show text toast
  static final _Texts _textToastMap = {};
  static Future<void> showText(
    String text, {
    Duration duration = const Duration(seconds: 3),
    TextToastType type = TextToastType.normal,
    Widget Function(Widget child)? builder,
  }) async {
    dismiss(ToastType.text);

    BuildContext? context = navigatorKey?.currentContext;
    if (context == null) return;

    /// Insert
    GlobalKey<TextToastBuilderState> key = GlobalKey();
    final overlay = Overlay.of(context);
    final toast = OverlayEntry(
      builder: (context) => TextToastBuilder(
        key: key,
        text: text,
        builder: builder,
        onPressed: () => dismiss(ToastType.text),
        onDismissed: () {
          final isMounted = _textToastMap[key]?.mounted ?? false;
          if (!isMounted) return;
          _textToastMap[key]?.remove();
          _textToastMap.remove(key);
        },
        icon: type.icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(2),
                child: AssetIcon(
                  type.icon!,
                  size: 24,
                  color: switch (type) {
                    TextToastType.warning => context.color.info,
                    TextToastType.success => context.color.success,
                    TextToastType.normal => null,
                  },
                ),
              ),
        duration: duration,
      ),
    );

    _textToastMap[key] = toast;
    overlay.insert(toast);
  }

  /// Show
  static final GlobalKey<SpinnerToastBuilderState> _spinnerKey = GlobalKey();
  static OverlayEntry? _spinnerOverlay;
  static Future<void> showSpinner({
    String? text,
    bool isCancelable = false,
  }) async {
    BuildContext? context = navigatorKey?.currentContext;
    if (context == null) return;
    if (_spinnerOverlay != null) return;

    /// Insert
    final overlay = Overlay.of(context);
    _spinnerOverlay = OverlayEntry(
      builder: (context) => SpinnerToastBuilder(
        key: _spinnerKey,
        text: text,
        onPressed: isCancelable ? () => dismiss(ToastType.spinner) : null,
      ),
    );
    overlay.insert(_spinnerOverlay!);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _spinnerKey.currentState?.show();
    });
  }

  static final GlobalKey<CustomToastBuilderState> _customKey = GlobalKey();
  static OverlayEntry? _customOverlay;
  static Future<void> showCustom({
    required Widget child,
    bool isCancelable = false,
    Duration duration = const Duration(milliseconds: 333),
  }) async {
    BuildContext? context = navigatorKey?.currentContext;
    if (context == null) return;
    if (_customOverlay != null) return;

    /// Insert
    final overlay = Overlay.of(context);
    _customOverlay = OverlayEntry(
      builder: (context) => CustomToastBuilder(
        key: _customKey,
        animDuration: duration,
        onPressed: isCancelable ? () => dismiss(ToastType.custom) : null,
        child: child,
      ),
    );
    overlay.insert(_customOverlay!);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _customKey.currentState?.show();
    });
  }
}
