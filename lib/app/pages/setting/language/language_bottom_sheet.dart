import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/language/language_bottom_sheet_model.dart';
import 'package:x_pr/app/pages/setting/language/language_bottom_sheet_state.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/components/tiles/radio_tile.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LanguageBottomSheetModel.new,
      state: (ref, prevState) => LanguageBottomSheetState(
        language: ref.read(ConfigService.$).language,
        isBusy: false,
      ),
      builder: (ref, viewModel, state) {
        return BaseBottomSheet(
          builder: (context, ref) => Padding(
            padding: EdgeInsets.only(
              bottom: context.screen.height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Language
                ...Language.values.map((language) {
                  return RadioTile(
                    title: Text(language.nativeName),
                    onPressed: (newLanguage) async {
                      if (await viewModel.onLanguageChanged(newLanguage)) {
                        Future.delayed(const Duration(milliseconds: 333), () {
                          if (context.mounted) {
                            context.pop();
                          }
                        });
                      }
                    },
                    value: language,
                    groupValue: state.language,
                  );
                }),

                /// Loader
                AnimTransOpacity(
                  isReverse: !state.isBusy,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Palette.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
