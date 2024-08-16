import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/log/platform/logger_mobile.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformInfo.isWeb
        ? const Scaffold(
            body: Center(
              child: Text("Not Supported Platform"),
            ),
          )
        : TalkerScreen(
            talker: (Logger.loggerPlatform as LoggerMobile).talker,
            theme: TalkerScreenTheme(
              backgroundColor: context.color.surface,
              textColor: context.color.text,
              cardColor: context.color.surface,
              logColors: {
                for (final type in TalkerLogType.values)
                  type: context.color.text,
                TalkerLogType.verbose: context.color.hint,
                TalkerLogType.info: context.color.text,
                TalkerLogType.debug: context.color.text,
                TalkerLogType.warning: context.color.warning,
                TalkerLogType.error: context.color.secondary,
              },
            ),
            appBarTitle: S.current.devLog,
          );
  }
}
