import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/result/widgets/game_result_canvas.dart';
import 'package:trouble_painter/app/pages/game/result/widgets/game_result_users.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// The result canvas with the players below it. The picked player's strokes pulse.
class GameResultSketches extends StatefulWidget {
  const GameResultSketches({
    super.key,
    required this.category,
    required this.keyword,
    required this.mafia,
    required this.userList,
    required this.sketchList,
    required this.onUserSelected,
  });

  final String category;
  final String keyword;
  final GameUser mafia;
  final List<GameUser> userList;
  final List<Sketch> sketchList;
  final void Function({required bool isMafia}) onUserSelected;

  @override
  State<GameResultSketches> createState() => _GameResultSketchesState();
}

class _GameResultSketchesState extends State<GameResultSketches> {
  /// The mafia is picked at first.
  late int _selectedId = widget.mafia.id;

  void _select(GameUser user) {
    if (user.id == _selectedId) return;
    setState(() => _selectedId = user.id);
    widget.onUserSelected(isMafia: user.id == widget.mafia.id);
  }

  /// The canvas and the players fit within this share of the screen.
  static const double _maxHeightFactor = 0.9;

  @override
  Widget build(BuildContext context) {
    final canvasMaxHeight =
        MediaQuery.sizeOf(context).height * _maxHeightFactor -
            GameResultUsers.heightFor(widget.userList.length);
    return Column(
      children: [
        GameResultCanvas(
          sketchList: widget.sketchList,
          category: widget.category,
          keyword: widget.keyword,
          mafia: widget.mafia,
          selectedUserId: _selectedId,
          maxHeight: canvasMaxHeight,
        ),
        GameResultUsers(
          mafia: widget.mafia,
          userList: widget.userList,
          selectedUserId: _selectedId,
          onPressed: _select,
        ),
      ],
    );
  }
}
