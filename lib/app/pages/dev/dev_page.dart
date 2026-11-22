import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/app/pages/dev/dev_page_model.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/switch_button/switch_button.dart';
import 'package:trouble_painter/core/theme/components/tiles/tile.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/core/utils/env/env.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DevPageModel.new,
      state: (ref, prevState) => ref.watch(ConfigService.$),
      builder: (ref, viewModel, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(S.current.dev),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 0.3.vh),
            child: Column(
              children: <Widget>[
                /// Flavor
                Tile(
                  title: const Text('Flavor'),
                  trailing: Text("${Env.FLAVOR}".toUpperCase()),
                  isTrailingIcon: false,
                ),

                /// Log
                Tile(
                  title: Text(S.current.devLog),
                  onPressed: () => context.pushNamed(Routes.devLogPage.name),
                ),

                /// LocalDataPage
                Tile(
                  title: Text(S.current.devLocalData),
                  onPressed: () =>
                      context.pushNamed(Routes.devLocalDataPage.name),
                ),

                /// Component page
                Tile(
                  title: Text(S.current.components),
                  onPressed: () => context.pushNamed(
                    Routes.devComponentPage.name,
                  ),
                ),

                /// Toggle UI test mode
                Tile(
                  title: Text(S.current.devUiTestMode),
                  isTrailingIcon: false,
                  trailing: SwitchButton(
                    value: state.isUiTestMode,
                    onChanged: (value) => viewModel.toggleUiTestMode(),
                  ),
                  onPressed: () => viewModel.toggleUiTestMode(),
                ),

                /// Toggle UI test mode mark
                Tile(
                  title: Text(S.current.devUiTestModeMark),
                  isTrailingIcon: false,
                  trailing: SwitchButton(
                    value: state.isUiTestModeMark,
                    onChanged: (value) => viewModel.toggleUiTestModeMark(),
                  ),
                  onPressed: () => viewModel.toggleUiTestModeMark(),
                ),
              ].conditionalWrap(
                builder: (child, index) => AnimTransOpacity(
                  delayIndex: index,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
