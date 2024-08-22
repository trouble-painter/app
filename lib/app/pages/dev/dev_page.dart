import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/dev_page_model.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

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

                /// Toggle game dev mode
                Tile(
                  title: Text(S.current.devGameDevMode),
                  isTrailingIcon: false,
                  trailing: CupertinoSwitch(
                    value: state.isGameDevMode,
                    onChanged: (value) => viewModel.toggleGameDevMode(),
                  ),
                  onPressed: () => viewModel.toggleGameDevMode(),
                ),

                /// Toggle UI test mode
                Tile(
                  title: Text(S.current.devUiTestMode),
                  isTrailingIcon: false,
                  trailing: CupertinoSwitch(
                    value: state.isUiTestMode,
                    onChanged: (value) => viewModel.toggleUiTestMode(),
                  ),
                  onPressed: () => viewModel.toggleUiTestMode(),
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
