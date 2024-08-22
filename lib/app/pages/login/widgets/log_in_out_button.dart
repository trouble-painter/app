import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';

class LogInOutButton extends StatelessWidget {
  const LogInOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Button(
        iconWidget: (color, isInactive) => Icon(
          switch (ref.watch(AuthService.$)) {
            Authenticated() => Icons.logout,
            Unauthenticated() => Icons.login,
          },
          color: color,
        ),
        type: ButtonType.flat,
        onPressed: () {
          switch (ref.read(AuthService.$)) {
            case Authenticated():
              context.pushNamed(Routes.devLogoutDialog.name);
              break;
            case Unauthenticated():
              context.pushNamed(Routes.devLoginBottomSheet.name);
              break;
          }
        },
      ),
    );
  }
}
