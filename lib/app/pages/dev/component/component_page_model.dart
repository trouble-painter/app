import 'package:x_pr/app/pages/dev/component/component_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';

class ComponentPageModel extends BaseViewModel<ComponentPageState> {
  ComponentPageModel(super.buildState);

  void emit(ComponentPageState newState) {
    state = newState;
  }
}
