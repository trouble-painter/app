import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';

/// The picture above the title: the mafia got away, or got caught.
class GameResultPicture extends StatelessWidget {
  const GameResultPicture({
    super.key,
    required this.isMafiaWin,
    this.onTap,
  });

  final bool isMafiaWin;
  final VoidCallback? onTap;

  /// The picture sinks this far into the canvas below, to close the seam.
  static const double _sink = 0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, _sink),
      child: GestureDetector(
        onTap: onTap,
        child: AssetImg(
          isMafiaWin ? 'result_mafia_win' : 'result_mafia_lose',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
