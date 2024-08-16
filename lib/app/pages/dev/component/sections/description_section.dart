import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/component/widgets/component_section.dart';
import 'package:x_pr/core/theme/components/description/description.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ComponentSection(
          title: "Large",
          children: [
            Description(
              title: "반가워요\n닉네임을 입력해 주세요",
              type: DescriptionType.large,
              content: [
                TextSpan(text: "최대 7자까지 쓸 수 있어요"),
              ],
            ),
          ],
        ),
        ComponentSection(
          title: "Small",
          children: [
            Description(
              title: "악동미술가는 키워드를 맞추지 못했어요",
              type: DescriptionType.small,
              content: [
                TextSpan(
                  text: "코카콜라",
                  style: context.typo.subHeader2.copyWith(
                    color: context.color.secondary,
                  ),
                ),
                const TextSpan(text: " 키워드를 입력하여 착한미술가들의 승리네요"),
              ],
            ),
          ],
        ),
      ].gap(height: 16),
    );
  }
}
