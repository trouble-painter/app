import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/utils/env/constant.dart';
import 'package:trouble_painter/core/utils/ext/object_ext.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

final class RiverpodLogger extends ProviderObserver {
  RiverpodLogger({this.enabled = true});
  final bool enabled;

  final regex = RegExp(r'<(.*?),');

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (!enabled) return;
    final name = regex.firstMatch("${context.provider.runtimeType}")?.group(1) ?? "";
    if (["$ConfigService"].contains(name)) {
      Logger.v("${Constant.eRemoteConfig} Config ${newValue?.pretty}");
    } else if (name != "$GameService" && name.contains("Service")) {
      // } else {
      Logger.v(
        '$name\n${Constant.eFrom} : $previousValue\n${Constant.eTo} : $newValue',
      );
    }
  }
}
