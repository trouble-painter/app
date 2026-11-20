import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/drawing/widgets/game_drawing_easel.dart';
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
    required this.myId,
    required this.mafiaAnswer,
    required this.userList,
    required this.sketchList,
    required this.onUserSelected,
    required this.bottomSpace,
  });

  final String category;
  final String keyword;
  final GameUser mafia;
  final int myId;

  /// What the mafia answered; empty when there was no answer
  final String mafiaAnswer;
  final List<GameUser> userList;
  final List<Sketch> sketchList;
  final void Function({required bool isMafia}) onUserSelected;

  /// Room to scroll the easel out from under the button
  final double bottomSpace;

  @override
  State<GameResultSketches> createState() => _GameResultSketchesState();
}

class _GameResultSketchesState extends State<GameResultSketches> {
  /// The mafia is picked at first.
  late int _selectedId = widget.mafia.id;

  final GlobalKey _sectionKey = GlobalKey();

  /// Where the canvas top lands in the viewport, as a share of its height, clear of the exit button.
  static const double _scrollAlignment = 0.06;

  /// Brings the canvas and the players on screen, so the lit strokes are seen.
  void _showSection() {
    final sectionContext = _sectionKey.currentContext;
    if (sectionContext == null) return;
    Scrollable.ensureVisible(
      sectionContext,
      alignment: _scrollAlignment,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _select(GameUser user) {
    _showSection();
    if (user.id == _selectedId) return;
    setState(() => _selectedId = user.id);
    widget.onUserSelected(isMafia: user.id == widget.mafia.id);
  }

  /// The canvas and the players fit within this share of the screen.
  static const double _maxHeightFactor = 0.9;

  /// Same side gaps as the drawing page
  static const double _canvasMargin = 20;
  static const double _easelMargin = 10;

  double get _easelHeight =>
      GameDrawingEasel.barHeight +
      GameResultUsers.heightFor(widget.userList.length);

  @override
  Widget build(BuildContext context) {
    final canvasMaxHeight =
        MediaQuery.sizeOf(context).height * _maxHeightFactor - _easelHeight;
    return Column(
      key: _sectionKey,
      children: [
        /// Canvas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _canvasMargin),
          child: GameResultCanvas(
            sketchList: widget.sketchList,
            category: widget.category,
            keyword: widget.keyword,
            mafia: widget.mafia,
            selectedUserId: _selectedId,
            maxHeight: canvasMaxHeight,
          ),
        ),

        /// Easel with the players standing on its legs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _easelMargin),
          child: SizedBox(
            height: _easelHeight,
            child: Stack(
              children: [
                const GameDrawingEasel(),
                Positioned(
                  top: GameDrawingEasel.barHeight,
                  left: 0,
                  right: 0,
                  child: GameResultUsers(
                    mafia: widget.mafia,
                    userList: widget.userList,
                    selectedUserId: _selectedId,
                    myId: widget.myId,
                    mafiaAnswer: widget.mafiaAnswer,
                    onPressed: _select,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: widget.bottomSpace),
      ],
    );
  }
}
