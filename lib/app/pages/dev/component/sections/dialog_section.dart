import 'package:flutter/material.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class DialogSection extends StatelessWidget {
  const DialogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Button(
          text: "Show Popup",
          onPressed: () {
            context.dialog(
              const ConfirmDialog(
                title: "타이틀",
                content: Text("내용"),
              ),
            );
          },
        ),
        Button(
          text: "Show Long Centent Popup",
          onPressed: () {
            context.dialog(
              const ConfirmDialog(
                title: "타이틀",
                content: Text(
                  '옛날 옛적, 아주 작은 마을에 세 형제가 살고 있었습니다. 이들은 서로 매우 다른 성격을 가지고 있었지만, 하나의 공통점이 있었습니다. 그들은 모두 마법을 사랑했고, 마법을 배우고자 하는 강한 열망을 가지고 있었죠.\n\n첫째 형, 에드윈은 가장 똑똑하고 책을 사랑하는 사람이었습니다. 그는 마법의 이론과 역사를 연구하는 데 시간을 보냈고, 항상 두꺼운 책을 손에 들고 있었습니다. 둘째 형, 베르나르는 강하고 용감한 전사였습니다. 그는 마법보다는 검술과 전투 기술에 더 관심이 많았지만, 마법을 이용해 더 강해질 수 있다는 생각에 마법을 배우기로 결심했습니다. 막내인 셀레나는 가장 마음이 따뜻하고 동물들을 사랑하는 소녀였습니다. 그녀는 자연과 소통하는 마법을 배우고 싶어 했습니다.\n\n어느 날, 이들은 숲 속 깊은 곳에 사는 전설적인 마법사, 알테미스를 찾아가기로 했습니다. 알테미스는 그들이 마법을 배우려면 먼저 각자 자신만의 시험을 통과해야 한다고 말했습니다. 시험을 통과한 자만이 마법을 배울 자격이 있다고 했죠.\n\n에드윈은 먼저 시험에 도전했습니다. 그의 시험은 지혜와 인내를 필요로 했습니다. 알테미스는 에드윈에게 고대의 마법 퍼즐을 주었습니다. 이 퍼즐은 수세기 동안 풀리지 않은 것이었고, 에드윈은 그것을 풀기 위해 며칠 밤낮을 고민했습니다. 마침내 에드윈은 퍼즐의 비밀을 풀었고, 알테미스는 그의 지혜를 인정했습니다.\n\n베르나르의 시험은 그의 용기를 시험하는 것이었습니다. 그는 거대한 드래곤과 싸워야 했습니다. 드래곤은 마을을 위협하고 있었고, 베르나르는 그의 강력한 검술과 마법의 방패를 사용하여 드래곤을 물리쳤습니다. 그의 용기는 모두에게 큰 영감을 주었고, 알테미스는 그의 용맹을 칭찬했습니다.\n\n마지막으로, 셀레나는 자신의 시험을 치르게 되었습니다. 그녀의 시험은 자연과의 조화를 이루는 것이었습니다. 그녀는 숲 속의 모든 동물들과 소통하며, 그들의 언어를 이해하고 그들을 도와주었습니다. 셀레나의 따뜻한 마음과 순수한 영혼은 자연의 영혼들에게 큰 감동을 주었고, 알테미스는 그녀의 순수함을 높이 평가했습니다.\n\n세 형제는 모두 자신들의 시험을 통과하고, 알테미스로부터 마법을 배우기 시작했습니다. 에드윈은 고대의 지식을 이용해 강력한 마법사를, 베르나르는 전투의 마법을 익혀 무적의 전사가, 셀레나는 자연의 마법을 이용해 숲의 수호자가 되었습니다.\n\n시간이 흘러, 이들은 각자의 길을 걸으며 세상을 더 나은 곳으로 만들기 위해 힘썼습니다. 그들은 서로 다른 길을 걷고 있었지만, 언제나 서로를 생각하며 함께했던 시간을 떠올렸습니다. 그들이 함께했던 모험과 배움은 이들 각자에게 큰 의미로 남아, 세상에 전설로 전해졌습니다.\n\n그리고 마을 사람들은 항상 말했습니다. "지혜와 용기, 그리고 순수한 마음이 있다면, 무엇이든 해낼 수 있다." 이들의 이야기는 후대에도 많은 사람들에게 영감을 주었고, 오랜 시간이 지나도 잊혀지지 않는 전설로 남아있었습니다.',
                ),
              ),
            );
          },
        ),
      ].gap(height: 8),
    );
  }
}
