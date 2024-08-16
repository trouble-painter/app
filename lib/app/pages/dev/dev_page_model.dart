import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class DevPageModel extends BaseViewModel<Config> {
  DevPageModel(super.initState);

  void toggleGameDevMode() {
    ref.read(ConfigService.$.notifier).toggleGameDevMode();
  }

  void toggleUiTestMode() {
    ref.read(ConfigService.$.notifier).toggleUiTestMode();
  }
}
