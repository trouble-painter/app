import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';

class JoinBottomSheetModel extends BaseViewModel<void> {
  JoinBottomSheetModel(super.buildState);

  BuildContext get context => ref.read(RoutesSetting.$).context;
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void qrPressed() {
    analyticsService.sendEvent(JoinBottomSheetQrClickEvent());
    context.pushReplacementNamed(Routes.joinQrPage.name);
  }

  void directInputPressed() {
    analyticsService.sendEvent(JoinBottomSheetDirectInputClickEvent());
    context.pushReplacementNamed(Routes.joinPage.name);
  }
}
