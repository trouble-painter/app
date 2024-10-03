import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_pr/core/theme/components/dialogs/dialog_color.dart';
import 'package:x_pr/core/theme/components/input/input_color.dart';
import 'package:x_pr/core/theme/dark_theme.dart';
import 'package:x_pr/core/theme/light_theme.dart';
import 'package:x_pr/core/theme/res/typo_secondary.dart';
import 'package:x_pr/core/theme/res/typo_tertiary.dart';

import '../components/toast/toast.dart';
import '../res/typo_primary.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo_primary.dart';
part 'app_typo_secondary.dart';
part 'app_typo_tertiary.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypoPrimary typo;
  late final AppTypoSecondary typoSecondary;
  late final AppTypoTertiary typoTertiary;
}

class InheritedAppTheme extends InheritedWidget {
  InheritedAppTheme({
    super.key,
    required Widget Function(BuildContext context) builder,
    required GlobalKey<NavigatorState> navigatorKey,
    bool isLightTheme = false,
  })  : appTheme = isLightTheme ? LightTheme() : DarkTheme(),
        super(child: Builder(builder: builder)) {
    Toast.navigatorKey ??= navigatorKey;
  }

  final AppTheme appTheme;

  @override
  bool updateShouldNotify(covariant InheritedAppTheme oldWidget) {
    return appTheme != oldWidget.appTheme;
  }
}

extension AppThemeBuildContextExt on BuildContext {
  InheritedAppTheme get inheritedAppTheme {
    return dependOnInheritedWidgetOfExactType<InheritedAppTheme>()!;
  }

  AppTheme get theme => inheritedAppTheme.appTheme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypoPrimary get typo => theme.typo;
  AppTypoSecondary get typoSecondary => theme.typoSecondary;
  AppTypoTertiary get typoTertiary => theme.typoTertiary;
  ThemeData get themeData => ThemeData(
        brightness: theme.brightness,
        scaffoldBackgroundColor: color.surface,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: color.surface,
          titleSpacing: 0,
          iconTheme: IconThemeData(color: color.text),
          surfaceTintColor: color.surface,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: theme.brightness,
          ),
          shadowColor: Colors.transparent,
          titleTextStyle: typo.subHeader1.copyWith(
            fontWeight: typo.bold,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: color.dialogSurface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          actionsPadding: const EdgeInsets.all(0),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: color.dialogSurface,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: color.primary,
        ),
        sliderTheme: SliderThemeData(
          thumbColor: color.primary,
          activeTrackColor: color.primary.withOpacity(0.25),
        ),
        dividerTheme: const DividerThemeData(
          space: 1,
        ),
      );
}
