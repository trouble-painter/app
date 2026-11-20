import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_switcher.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// Tells who is the top-voted suspect so far, or that the vote is tied.
class GameVotingSuspect extends StatelessWidget {
  const GameVotingSuspect({
    super.key,
    required this.topVotedUsers,
    this.onPressed,
  });

  /// Several on a tie, empty before any vote
  final List<GameUser> topVotedUsers;
  final VoidCallback? onPressed;

  static const double _fontScale = 1.25;

  /// Only a single suspect has a nickname to color
  GameUser? get _suspect =>
      topVotedUsers.length == 1 ? topVotedUsers.first : null;

  String get _text => switch (topVotedUsers.length) {
        0 => S.current.gameVotingNoSuspect,
        1 => S.current.gameVotingTopSuspect(topVotedUsers.first.nickname),
        final n => S.current.gameVotingTie(n),
      };

  @override
  Widget build(BuildContext context) {
    final style = context.typo.body2.copyWith(
      fontSize: context.typo.body2.fontSize! * _fontScale,
      color: context.color.text,
    );
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimSwitcher<String>(
        state: _text,
        builder: (text) => LayoutBuilder(
          key: ValueKey(text),
          builder: (context, constraints) {
            /// TextBalancer cannot take colored spans, so balance the lines here.
            final balanced = text.balance(
              textStyle: style,
              maxWidth: constraints.maxWidth,
            );
            return Text.rich(
              _span(context, balanced, text, style),
              maxLines: 2,
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
    );
  }

  /// Colors the suspect's nickname with the player color.
  InlineSpan _span(
    BuildContext context,
    String balanced,
    String text,
    TextStyle style,
  ) {
    final suspect = _suspect;
    final start = suspect == null ? -1 : text.indexOf(suspect.nickname);

    /// Balancing only swaps spaces for line breaks, so the indexes still match.
    if (start < 0 || balanced.length != text.length) {
      return TextSpan(text: balanced, style: style);
    }
    final end = start + suspect!.nickname.length;
    return TextSpan(
      style: style,
      children: [
        TextSpan(text: balanced.substring(0, start)),
        TextSpan(
          text: balanced.substring(start, end),
          style: TextStyle(
            color: suspect.color,
            fontWeight: context.typo.bold,
          ),
        ),
        TextSpan(text: balanced.substring(end)),
      ],
    );
  }
}
