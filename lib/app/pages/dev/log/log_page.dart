import 'package:material_ui/material_ui.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/log/platform/logger_mobile.dart';
import 'package:trouble_painter/core/utils/platform/platform_info.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformInfo.isWeb) {
      return const Scaffold(
        body: Center(
          child: Text("Not Supported Platform"),
        ),
      );
    }
    final talker = (Logger.loggerPlatform as LoggerMobile).talker;
    return TalkerScreen(
      talker: talker,
      theme: TalkerScreenTheme(
        backgroundColor: context.color.surface,
        textColor: context.color.text,
        cardColor: context.color.surface,
        logColors: {
          for (final type in talker.settings.titles.keys)
            type: context.color.text,
          TalkerKey.verbose: context.color.hint,
          TalkerKey.info: context.color.text,
          TalkerKey.debug: context.color.text,
          TalkerKey.warning: context.color.warning,
          TalkerKey.error: context.color.secondary,
        },
      ),
      appBarTitle: S.current.devLog,
    );
  }
}
