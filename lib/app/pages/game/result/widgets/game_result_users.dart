import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_turn_bubble.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/components/profile/profile.dart';
import 'package:trouble_painter/core/theme/components/profile/profile_citizen.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';
import 'package:trouble_painter/core/utils/ext/color_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// Faces and nicknames of everyone in the game, the mafia first, standing on the easel legs.
class GameResultUsers extends StatelessWidget {
  const GameResultUsers({
    super.key,
    required this.mafia,
    required this.userList,
    required this.selectedUserId,
    required this.mafiaAnswer,
    required this.onPressed,
  });

  final GameUser mafia;
  final List<GameUser> userList;
  final int selectedUserId;

  /// What the mafia answered; empty when there was no answer
  final String mafiaAnswer;
  final void Function(GameUser user) onPressed;

  static const int _columns = 5;
  static const double _itemHeight = 84;
  static const double _runSpacing = 0;
  static const double _badgeSize = 20;
  static const Duration _badgeDuration = Duration(milliseconds: 200);
  static const double _mafiaFaceSize = 40;

  /// The answer bubble may be as wide as this many columns, and this many lines.
  static const int _bubbleColumns = 4;
  static const int _bubbleMaxLines = 2;
  static const int _bubbleLineLength = 10;
  static const double _bubbleRadius = 12;
  static const double _bubbleGap = 4;
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
                    answer: user.id == mafia.id ? mafiaAnswer : '',
                    itemWidth: constraints.maxWidth / _columns,
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
    required this.answer,
    required this.itemWidth,
  });

  final GameUser user;
  final bool isMafia;
  final bool isSelected;

  /// Shown as a bubble over the face when not empty
  final String answer;
  final double itemWidth;

  /// Breaks [text] every [GameResultUsers._bubbleLineLength] characters.
  static String _breakLines(String text) {
    final chars = text.characters;
    return [
      for (var i = 0; i < chars.length; i += GameResultUsers._bubbleLineLength)
        chars
            .skip(i)
            .take(GameResultUsers._bubbleLineLength)
            .toString(),
    ].join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final nicknameStyle = context.typo.caption2;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// Answer bubble, from the column's left and growing to the right
        if (answer.isNotEmpty)
          Positioned(
            left: 0,
            right: -itemWidth * (GameResultUsers._bubbleColumns - 1),
            bottom: GameResultUsers._itemHeight + GameResultUsers._bubbleGap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GameDrawingTurnBubble(
                  text: _breakLines(answer),
                  color: context.color.primary,
                  textColor: context.color.primary.readableTextColor,
                  arrowX: itemWidth / 2,
                  maxLines: GameResultUsers._bubbleMaxLines,
                  maxRadius: GameResultUsers._bubbleRadius,
                ),
              ],
            ),
          ),

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
