import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/join_bottom_sheet/join_bottom_sheet_model.dart';
import 'package:x_pr/app/pages/home/join_bottom_sheet/widgets/join_button.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/core/view/base_view.dart';

class JoinBottomSheet extends StatelessWidget {
  const JoinBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<JoinBottomSheetModel, void>(
      viewModel: JoinBottomSheetModel.new,
      state: (ref, prevState) {},
      builder: (ref, viewModel, state) => BaseBottomSheet(
        builder: (context, ref) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: 36,
            ),
            child: Row(
              children: [
                Expanded(
                  child: JoinButton(
                    image: 'qr',
                    text: S.current.joinBottomSheetQrScan,
                    onPressed: viewModel.qrPressed,
                  ),
                ),
                Expanded(
                  child: JoinButton(
                    image: 'code',
                    text: S.current.joinBottomSheetEnterCode,
                    onPressed: viewModel.directInputPressed,
                  ),
                ),
              ].gap(height: 16),
            ),
          );
        },
      ),
    );
  }
}
