import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/audio/domain/entities/audio_state.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class AudioService {
  static final $ = Provider<AudioService>((ref) {
    return AudioService(ref: ref);
  });

  AudioService({
    required Ref ref,
  }) : _ref = ref;

  late AudioState _state = AudioState(
    homeBgmUrl: config.bgmUrl,
    gameBgmUrl: config.gameBgmUrl,
    isInGame: false,
    isBgmOff: config.isBgmDisabled ? true : config.isBgmMute,
    player: AudioPlayer()..setLoopMode(LoopMode.all),
  );
  final Ref _ref;
  final AudioPlayer _resultPlayer = AudioPlayer();
  Config get config => _ref.read(ConfigService.$);

  void _emit(AudioState state) {
    _state = state;
  }

  Future<void> init() async {
    final session = await AudioSession.instance;
    await session.configure(
      const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.ambient,
      ),
    );
    await session.setActive(true);

    _ref.listen(ConfigService.$, (previous, next) {
      /// On config changed
      _emit(
        _state.copyWith(
          homeBgmUrl: config.bgmUrl,
          gameBgmUrl: config.gameBgmUrl,
          isBgmOff: config.isBgmDisabled ? true : config.isBgmMute,
        ),
      );

      if (_state.isBgmOff && _state.isPlaying) {
        /// Pause by config
        pause();
      } else if (!_state.isBgmOff && !_state.isPlaying) {
        /// Play by config
        play();
      }
    });
  }

  /// Stops the BGM and plays the win or lose sound once.
  /// The BGM restarts from the beginning on the next `play(isInGame: ...)`.
  Future<void> playResult({required bool isWin}) async {
    _state.pause();
    _emit(_state.copyWith(isResult: true));
    final url = isWin ? config.winBgmUrl : config.loseBgmUrl;
    if (_state.isBgmOff || url.isEmpty) return;
    Logger.d("🎶 play result : ${isWin ? 'win' : 'lose'}");
    try {
      await _resultPlayer.setUrl(url);
      await _resultPlayer.play();
    } catch (e, s) {
      Logger.e("Failed to play result sound", e, s);
    }
  }

  void play({bool? isInGame}) {
    final bool wasResult = _state.isResult;
    if (_state.isBgmOff) {
      if (isInGame != null) {
        _emit(_state.copyWith(isInGame: isInGame, isResult: false));
      }
      return;
    }

    /// Resume or config changes must not bring the BGM back over the result sound.
    if (wasResult && isInGame == null) return;
    final bool isInGameChanged = _state.isInGame != isInGame;
    final bool isBgmUrlChanged =
        isInGame == null ? false : (isInGameChanged || wasResult);
    if (_state.isPlaying && !isBgmUrlChanged) return;

    if (wasResult) _resultPlayer.stop();
    _emit(_state.copyWith(isInGame: isInGame, isResult: false));
    final position = isBgmUrlChanged ? Duration.zero : null;
    Logger.d("🎶 play : $position");
    _state.play(position: position);
  }

  void pause() {
    Logger.d("🎶 pause");
    _state.pause();
  }

  void dispose() {
    _state.player.dispose();
    _resultPlayer.dispose();
  }
}
