import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Breakpoints {
  /// Device max width
  static const double mobile = 600;
  static const double tablet = 1000;
  static const double desktop = 1190;

  /// Device max height
  static const double smallHeight = 667;

  /// BottomSheet max width
  static const double bottomSheet = 600;
}

extension LayoutExt on BuildContext {
  /// Allo only portrait
  static void allowOnlyPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// SafeArea padding
  EdgeInsets get safeaAreaPadding => MediaQuery.of(this).padding;

  /// SafeArea size
  static Size safeAreaSize = Size.zero;

  /// Canvas size
  double get canvasRatio => canvasSize.width / canvasSize.height;
  Size get canvasSize => Size(
        safeAreaSize.width - 40,
        safeAreaSize.height - 222,
      );

  /// Screen size
  static Size screenSize = Size.zero;
  Size get screen {
    if (screenSize == Size.zero) {
      screenSize = MediaQuery.of(this).size;
    }
    return screenSize;
  }

  /// Keyboard height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Responsive width
  T responsiveW<T>(
    T base, {
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    if (screen.width < Breakpoints.mobile) {
      return mobile ?? base;
    } else if (screen.width < Breakpoints.tablet) {
      return tablet ?? base;
    } else {
      return desktop ?? base;
    }
  }

  /// Responsive height
  T responsiveH<T>(
    T base, {
    T? small,
    T? normal,
    bool? isShowSmall,
  }) {
    if (isShowSmall ?? screen.height <= Breakpoints.smallHeight) {
      return small ?? base;
    } else {
      return normal ?? base;
    }
  }
}

extension LayoutNumExt on num {
  /// Design ratio
  double get dw => LayoutExt.screenSize.width * this / 375;
  double get dh => LayoutExt.screenSize.height * this / 812;

  /// Screen ratio
  double get vw => LayoutExt.screenSize.width * this;
  double get vh => LayoutExt.screenSize.height * this;
}
