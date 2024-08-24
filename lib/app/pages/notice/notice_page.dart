import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/notice/notice_page_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/webview/webview.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

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
