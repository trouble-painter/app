import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/profile/profile_citizen.dart';
import 'package:x_pr/core/theme/components/profile/profile_empty.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';

class GameWaitingUsers extends StatelessWidget {
  const GameWaitingUsers({
    super.key,
    required this.myIndex,
    required this.hostIndex,
    required this.userList,
    required this.maxUser,
    required this.onPressed,
  });

  final List<GameUser> userList;
  final int maxUser;
  final int myIndex;
  final int hostIndex;
  final void Function(GameUser user) onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const int nColumn = 4;
        final double width = constraints.maxWidth / nColumn;
        return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 32,
          children: List.generate(maxUser, (i) {
            final isUser = userList.length - 1 >= i;
            final isHost = i == hostIndex;
            final isMe = i == myIndex;
            if (isUser) {
              /// User
              final user = userList[i];
              return GestureDetector(
                onTap: () => onPressed(user),
                child: SizedBox(
                  width: width,
                  child: ProfileCitizen(
                    user: user,
                    isHost: isHost,
                    badge: isMe ? S.current.me : null,
                  ),
                ),
              );
            } else {
              /// Empty
              return SizedBox(
                width: width,
                child: const ProfileEmpty(),
              );
            }
          }),
        );
      },
    );
  }
}
