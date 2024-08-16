import 'dart:async';

import 'package:flutter/material.dart';

class Throttle {
  Timer? _timer;

  void run(int milliseconds, VoidCallback action) {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer(Duration(milliseconds: milliseconds), () {
        action();
        _timer = null;
      });
    }
  }

  void cancel() {
    _timer?.cancel();
  }
}
