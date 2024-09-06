import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/component/widgets/component_section.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';

class ToastSection extends StatelessWidget {
  const ToastSection({super.key});

  @override
  Widget build(BuildContext context) {
    const shortText = "펭도리 님, 환영해요";
    const longText = "펭도리 님, 환영해요 트러블 페인터를 찾아 미술관을 지켜내세요!";
    return ListView(
      children: [
        /// Text
        ComponentSection(
          title: "Text",
          children: [
            Button(
              text: "짧은 메세지",
              onPressed: () {
                Toast.showText(shortText);
              },
            ),
            Button(
              text: "긴 메세지",
              onPressed: () {
                Toast.showText(longText);
              },
            ),
          ],
        ),

        /// Icon
        ComponentSection(
          title: "Icon",
          children: [
            Button(
              text: "경고",
              onPressed: () {
                Toast.showText(
                  shortText,
                  type: TextToastType.warning,
                );
              },
            ),
            Button(
              text: "성공",
              onPressed: () {
                Toast.showText(
                  shortText,
                  type: TextToastType.success,
                );
              },
            ),
            Button(
              text: "긴 메세지",
              onPressed: () {
                Toast.showText(
                  longText,
                  type: TextToastType.success,
                );
              },
            ),
          ],
        ),

        /// Spinner
        ComponentSection(
          title: "Spinner",
          children: [
            Button(
              text: "Show Short Title Spinner",
              onPressed: () {
                Toast.showSpinner(
                  text: S.current.gamePageReconnecting,
                  isCancelable: true,
                );
              },
            ),
            Button(
              text: "Show Long Title Spinner",
              onPressed: () {
                Toast.showSpinner(
                  text: longText,
                  isCancelable: true,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
