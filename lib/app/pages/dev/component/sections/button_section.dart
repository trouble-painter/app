import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/component/widgets/component_section.dart';
import 'package:x_pr/app/pages/dev/component/widgets/measure.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Button : fill
        ComponentSection(
          title: "Fill",
          children: [
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.large,
                type: ButtonType.fill,
                text: "Large",
                onPressed: () {},
              ),
            ),
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.regular,
                type: ButtonType.fill,
                text: "Regular",
                onPressed: () {},
              ),
            ),
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.regular,
                type: ButtonType.fill,
                shadow: context.deco.highlight,
                text: "Regular / Highlight",
                onPressed: () {},
              ),
            ),
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.regular,
                type: ButtonType.fill,
                disabled: true,
                text: "Regular / Disabled",
                onPressed: () {},
              ),
            ),
          ],
        ),

        /// Button : flat
        ComponentSection(
          title: "Text",
          children: [
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.regular,
                type: ButtonType.flat,
                text: "Button",
                onPressed: () {},
              ),
            ),
            Measure(
              child: Button(
                width: double.infinity,
                size: ButtonSize.regular,
                type: ButtonType.flat,
                disabled: true,
                text: "Button(Disabled)",
                onPressed: () {},
              ),
            ),
          ],
        ),

        /// Icon
        ComponentSection(
          title: "Icon",
          children: [
            Measure(
              child: Button(
                icon: 'go_out',
                onPressed: () {},
              ),
            ),
            Measure(
              child: Button(
                icon: 'go_out',
                disabled: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
