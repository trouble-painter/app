import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class DevPageModel extends BaseViewModel<Config> {
  DevPageModel(super.initState);

  void toggleUiTestMode() {
    ref.read(ConfigService.$.notifier).toggleUiTestMode();
  }

  void toggleUiTestModeMark() {
    ref.read(ConfigService.$.notifier).toggleUiTestModeMark();
  }
}
