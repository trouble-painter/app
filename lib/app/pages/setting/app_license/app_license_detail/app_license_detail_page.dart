import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_detail/app_license_detail_page_model.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_detail/app_license_detail_page_state.dart';
import 'package:x_pr/app/pages/setting/app_license/widgets/app_license_app_bar.dart';
import 'package:x_pr/core/view/base_view.dart';

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

                /// AppBar
                AppLicenseAppBar(
                  title: state.package,
                  onPopPressed: viewModel.onPopPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
