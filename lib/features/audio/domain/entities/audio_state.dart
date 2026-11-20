import 'package:just_audio/just_audio.dart';

class AudioState {
  final String homeBgmUrl;
  final String gameBgmUrl;
  final bool isInGame;
  final bool isBgmOff;

  /// True while the win/lose sound owns the audio, so the BGM must stay stopped.
  final bool isResult;
  final AudioPlayer player;

  AudioState({
    required this.homeBgmUrl,
    required this.gameBgmUrl,
    required this.isInGame,
    required this.isBgmOff,
    this.isResult = false,
    required this.player,
  });

  bool get isPlaying => player.playerState.playing;
  String get bgmUrl => isInGame ? gameBgmUrl : homeBgmUrl;

  Future<void> play({Duration? position}) async {
    player.setUrl(bgmUrl, preload: true, initialPosition: position);
    player.play();
  }

  void pause() {
    player.pause();
  }

  void stop() {
    player.stop();
  }

  AudioState copyWith({
    String? homeBgmUrl,
    String? gameBgmUrl,
    bool? isInGame,
    bool? isBgmOff,
    bool? isResult,
    AudioPlayer? player,
  }) {
    return AudioState(
      homeBgmUrl: homeBgmUrl ?? this.homeBgmUrl,
      gameBgmUrl: gameBgmUrl ?? this.gameBgmUrl,
      isInGame: isInGame ?? this.isInGame,
      isBgmOff: isBgmOff ?? this.isBgmOff,
      isResult: isResult ?? this.isResult,
      player: player ?? this.player,
    );
  }
}
