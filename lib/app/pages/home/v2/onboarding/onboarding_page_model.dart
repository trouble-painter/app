import 'package:flutter/material.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class OnboardingPageModel extends BaseViewModel<void> {
  OnboardingPageModel(super.buildState);

  Language get language => ref.read(ConfigService.$).language;
  PageController controller = PageController(
    initialPage: 5000,
  );
}
