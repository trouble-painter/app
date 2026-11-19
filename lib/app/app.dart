import 'package:flutter_localizations/flutter_localizations.dart' as fl;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/network/domain/services/network_service.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LayoutExt.screenSize = MediaQuery.of(context).size;

      /// Platform brightness
      // final platformBrightness = MediaQuery.of(context).platformBrightness;

      /// Allow only portrait
      LayoutExt.allowOnlyPortrait();

      /// Init config
      await ref.read(ConfigService.$.notifier).init();

      /// Init network
      ref.read(NetworkService.$.notifier).init();

      setState(() {
        isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const SizedBox();
    }

    final config = ref.watch(ConfigService.$);
    final routesSetting = ref.read(RoutesSetting.$);
    return InheritedAppTheme(
      navigatorKey: routesSetting.navigatorKey,
      isLightTheme: config.isLightTheme,
      builder: (context) => MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          ...GlobalMaterialLocalizations.delegates,

          /// For third-party widgets still on package:flutter/material.dart (e.g. TalkerScreen)
          // ignore: deprecated_member_use
          fl.GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: config.language.locale,
        theme: context.themeData,
        routerConfig: routesSetting.router,
        builder: (context, child) => Stack(
          fit: StackFit.expand,
          children: [
            /// Child
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: Toast.init(
                child,
              ),
            ),

            /// UI Test Mode
            if (config.isUiTestMode && config.isUiTestModeMark)
              Positioned(
                top: 8,
                left: 8,
                child: DefaultTextStyle(
                  style: context.typo.caption2,
                  child: SafeArea(
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: context.color.primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
