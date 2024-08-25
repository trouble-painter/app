import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/game/data/models/x/x_game_option.dart';
import 'package:x_pr/features/game/data/models/x/x_game_user.dart';

part 'x_game_info.freezed.dart';
part 'x_game_info.g.dart';

@freezed
class XGameInfo with _$XGameInfo {
  factory XGameInfo({
    required int mafiaUserId,
    required String roomId,
    required String category,
    required String answer,
    required bool isRandomMatching,
    required List<XGameUser> turnList,
    @JsonKey(name: "gameOption") required XGameOption option,
  }) = _XGameInfo;

  XGameInfo._();

  factory XGameInfo.fromJson(Map<String, dynamic> json) =>
      _$XGameInfoFromJson(json);
}
