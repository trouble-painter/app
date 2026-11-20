import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/components/profile/profile.dart';
import 'package:trouble_painter/core/theme/components/profile/profile_citizen.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// Faces and nicknames of everyone in the game, the mafia first, standing on the easel legs.
class GameResultUsers extends StatelessWidget {
  const GameResultUsers({
    super.key,
    required this.mafia,
    required this.userList,
    required this.selectedUserId,
    required this.onPressed,
  });

  final GameUser mafia;
  final List<GameUser> userList;
  final int selectedUserId;
  final void Function(GameUser user) onPressed;

  static const int _columns = 5;
  static const double _itemHeight = 84;
  static const double _runSpacing = 0;
  static const double _badgeSize = 20;
  static const Duration _badgeDuration = Duration(milliseconds: 200);
  static const double _mafiaFaceSize = 40;
  static const EdgeInsets _padding = EdgeInsets.fromLTRB(10, 21, 10, 12);

  /// Total height of the list for [userCount] players
  static double heightFor(int userCount) {
    final rows = (userCount / _columns).ceil();
    return _padding.vertical + rows * _itemHeight + (rows - 1) * _runSpacing;
  }

  @override
  Widget build(BuildContext context) {
    final orderedList = [
      mafia,
      for (final user in userList)
        if (user.id != mafia.id) user,
    ];
    return Padding(
      padding: _padding,
      child: LayoutBuilder(
        builder: (context, constraints) => Wrap(
          alignment: WrapAlignment.center,
          runSpacing: _runSpacing,
          children: [
            for (final user in orderedList)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onPressed(user),
                child: SizedBox(
                  width: constraints.maxWidth / _columns,
                  height: _itemHeight,
                  child: _User(
                    user: user,
                    isMafia: user.id == mafia.id,
                    isSelected: user.id == selectedUserId,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _User extends StatelessWidget {
  const _User({
    required this.user,
    required this.isMafia,
    required this.isSelected,
  });

  final GameUser user;
  final bool isMafia;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final nicknameStyle = context.typo.caption2;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// Face
        Align(
          alignment: Alignment.topCenter,
          child: isMafia
              ? Profile(
                  backgroundColor: user.color,
                  nickname: user.nickname,
                  nicknameStyle: nicknameStyle,
                  size: ProfileSize.small,
                  image: const Center(
                    child: AssetIcon(
                      'mafia',
                      size: GameResultUsers._mafiaFaceSize,
                      useIconColor: true,
                    ),
                  ),
                )
              : ProfileCitizen(
                  user: user,
                  size: ProfileSize.small,
                  nicknameStyle: nicknameStyle,
                  isConnect: true,
                ),
        ),

        /// Anchored to the circle, not to the nickname that may be wider
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox.square(
            dimension: ProfileSize.small.diameter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                /// Brush on the picked one
                Positioned(
                  top: -4,
                  right: -4,
                  child: AnimatedScale(
                    scale: isSelected ? 1 : 0,
                    duration: GameResultUsers._badgeDuration,
                    curve: isSelected ? Curves.easeOutBack : Curves.easeIn,
                    child: AnimatedOpacity(
                      opacity: isSelected ? 1 : 0,
                      duration: GameResultUsers._badgeDuration,
                      child: Container(
                        width: GameResultUsers._badgeSize,
                        height: GameResultUsers._badgeSize,
                        decoration: BoxDecoration(
                          color: context.color.text,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Palette.black.withValues(alpha: 0.4),
                              offset: const Offset(1, 2),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.brush_rounded,
                          size: 14,
                          color: context.color.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
