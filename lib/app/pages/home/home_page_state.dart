import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';

class HomePageState {
  final bool isBusy;
  final NoticeDialogData? noticeDialogData;
  final String? playingRoomId;
  final String nickname;

  const HomePageState({
    bool? isBusy,
    this.noticeDialogData,
    required this.nickname,
    required this.playingRoomId,
  }) : isBusy = isBusy ?? false;

  bool get isPlayingRoom => playingRoomId != null;

  HomePageState copyWith({
    bool? isBusy,
    NoticeDialogData? noticeDialogData,
    String? playingRoomId,
    String? nickname,
  }) {
    return HomePageState(
      isBusy: isBusy ?? this.isBusy,
      noticeDialogData: noticeDialogData ?? this.noticeDialogData,
      playingRoomId: playingRoomId ?? this.playingRoomId,
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  String toString() {
    return 'HomePageState(isBusy: $isBusy, noticeDialogData: $noticeDialogData, playingRoomId: $playingRoomId, nickname: $nickname)';
  }
}
