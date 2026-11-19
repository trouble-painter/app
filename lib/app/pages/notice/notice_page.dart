import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/notice/notice_page_model.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/webview/webview.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: NoticePageModel.new,
      state: (ref, prevState) => ref.read(ConfigService.$).noticeUrl,
      builder: (ref, viewModel, state) => Webview(
        title: S.current.settingNotice,
        url: state,
      ),
    );
  }
}
