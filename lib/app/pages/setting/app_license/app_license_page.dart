import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page_model.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page_state.dart';
import 'package:x_pr/app/pages/setting/app_license/widgets/app_license_app_bar.dart';
import 'package:x_pr/app/pages/setting/app_license/widgets/app_license_list_view.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class AppLicensePage extends StatelessWidget {
  const AppLicensePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: AppLicensePageModel.new,
      state: (ref, prevState) => AppLicensePageState.init(),
      initState: (ref, viewModel) {
        viewModel.init();
      },
      builder: (ref, viewModel, state) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: state.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : AppLicenseListView(
                          state: state,
                          config: ref.watch(ConfigService.$),
                          onBgmLicensePressed: viewModel.onBgmLicensePressed,
                          onLicensePressed: viewModel.onLicensePressed,
                        ),
                ),

                /// AppBar
                AppLicenseAppBar(
                  title: S.current.settingLicense,
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
