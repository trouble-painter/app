import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/component/component_page_model.dart';
import 'package:x_pr/app/pages/dev/component/component_page_state.dart';
import 'package:x_pr/app/pages/dev/component/sections/animation_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/button_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/description_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/dialog_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/icon_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/input_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/tiles_section.dart';
import 'package:x_pr/app/pages/dev/component/sections/toast_section.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_switcher.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ComponentPageModel.new,
      state: (ref, prevState) => ComponentPageState.values.first,
      builder: (ref, viewModel, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.components),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: AnimSwitcher(
                  state: state,
                  builder: (state) => switch (state) {
                    ComponentPageState.button => const ButtonSection(),
                    ComponentPageState.icon => const IconSection(),
                    ComponentPageState.toast => const ToastSection(),
                    ComponentPageState.dialog => const DialogSection(),
                    ComponentPageState.input => const InputSection(),
                    ComponentPageState.tile => const TilesSection(),
                    ComponentPageState.animation => const AnimationSection(),
                    ComponentPageState.description =>
                      const DescriptionSection(),
                  },
                ),
              ),
              const Divider(),
              SizedBox(
                height: kToolbarHeight,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ComponentPageState.values.map((component) {
                    return Builder(
                      builder: (context) {
                        return Button(
                          text: component.name.toUpperCase(),
                          type: ButtonType.flat,
                          color:
                              component == state ? context.color.primary : null,
                          onPressed: () {
                            Scrollable.ensureVisible(
                              context,
                              alignment: 0.5,
                              duration: const Duration(milliseconds: 333),
                            );
                            viewModel.emit(component);
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
