import 'package:trouble_painter/app/pages/dev/component/component_page_state.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';

class ComponentPageModel extends BaseViewModel<ComponentPageState> {
  ComponentPageModel(super.buildState);

  void emit(ComponentPageState newState) {
    state = newState;
  }
}
