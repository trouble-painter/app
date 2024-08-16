import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/language/language_bottom_sheet_model.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/tiles/radio_tile.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) {
        return BaseView(
          viewModel: LanguageBottomSheetModel.new,
          state: (ref, prevState) => ref.read(ConfigService.$).language,
          builder: (ref, viewModel, state) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: context.screen.height * 0.15,
              ),
              child: Column(
                children: Language.values.map((language) {
                  return RadioTile(
                    title: Text(language.nativeName),
                    onPressed: (value) async {
                      if (await viewModel.onLanguageChanged(value)) {
                        Future.delayed(const Duration(milliseconds: 333), () {
                          if (context.mounted) {
                            context.pop();
                          }
                        });
                      }
                    },
                    value: language,
                    groupValue: state,
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
