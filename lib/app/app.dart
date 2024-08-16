import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/network/domain/service/network_service.dart';

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
    return InheritedAppTheme(
      navigatorKey: Routes.navigatorKey,
      isLightTheme: config.isLightTheme,
      builder: (context) => MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: config.language.locale,
        theme: context.themeData,
        routerConfig: Routes.config,
        builder: (context, child) => Stack(
          fit: StackFit.expand,
          children: [
            /// Child
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: Toast.init(child),
            ),

            /// UI Test Mode
            if (config.isUiTestMode)
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
