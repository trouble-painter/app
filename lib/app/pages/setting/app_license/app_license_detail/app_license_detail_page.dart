import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/setting/app_license/app_license_detail/app_license_detail_page_model.dart';
import 'package:trouble_painter/app/pages/setting/app_license/app_license_detail/app_license_detail_page_state.dart';
import 'package:trouble_painter/app/pages/setting/app_license/widgets/app_license_app_bar.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/view/base_view.dart';

class AppLicenseDetailPage extends StatelessWidget {
  const AppLicenseDetailPage({
    super.key,
    required this.package,
    required this.licenseEntries,
  });
  final String package;
  final List<LicenseEntry> licenseEntries;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AppLicenseDetailPageModel.new,
      state: (ref, prevState) => AppLicenseDetailPageState(
        package: package,
        licenseEntries: licenseEntries,
      ),
      builder: (ref, viewModel, state) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimTransOpacity(
                    delayIndex: 1,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 74),
                      children: state.licenseEntries.map((licenseEntry) {
                        final content = licenseEntry.paragraphs.fold(
                          "",
                          (prev, paragraph) {
                            return "${prev.isEmpty ? "" : "$prev\n"}${paragraph.text}\n";
                          },
                        );
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(content),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                /// AppBar
                AnimTransOpacity(
                  delayIndex: 0,
                  child: AppLicenseAppBar(
                    title: state.package,
                    onPopPressed: viewModel.onPopPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
