import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_model.dart';
import 'package:x_pr/core/view/base_view.dart';

class JoinQrPage extends StatelessWidget {
  const JoinQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: JoinQrPageModel.new,
      state: (ref, prevState) => 1,
      builder: (ref, viewModel, state) => const Scaffold(),
    );
  }
}
