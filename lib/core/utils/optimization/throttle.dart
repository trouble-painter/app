import 'dart:async';

import 'package:material_ui/material_ui.dart';

/// Runs an action at once, then at most once per window.
class Throttle {
  Timer? _window;
  VoidCallback? _trailingAction;

  /// Runs [action] now unless a window is open.
  /// Within the window it is dropped, or with [trailing] the latest one runs when the window ends.
  void run(int milliseconds, VoidCallback action, {bool trailing = false}) {
    if (_window?.isActive ?? false) {
      if (trailing) _trailingAction = action;
      return;
    }
    _run(milliseconds, action);
  }

  /// Runs the waiting trailing action now, if any.
  void flush() {
    final action = _trailingAction;
    cancel();
    action?.call();
  }

  void cancel() {
    _window?.cancel();
    _window = null;
    _trailingAction = null;
  }

  void _run(int milliseconds, VoidCallback action) {
    _window = Timer(Duration(milliseconds: milliseconds), () {
      final trailing = _trailingAction;
      _trailingAction = null;
      if (trailing != null) _run(milliseconds, trailing);
    });
    action();
  }
}
