import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:x_pr/features/audio/domain/entity/audio_state.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class AudioService {
  static final $ = Provider<AudioService>((ref) {
    return AudioService(ref: ref);
  });

  AudioService({
    required ProviderRef<AudioService> ref,
  }) : _ref = ref;

  late AudioState _state = AudioState(
    homeBgmUrl: config.bgmUrl,
    gameBgmUrl: config.gameBgmUrl,
    isInGame: false,
    isBgmOff: config.isBgmDisabled ? true : config.isBgmMute,
    player: AudioPlayer()..setLoopMode(LoopMode.all),
  );
  final ProviderRef<AudioService> _ref;
  Config get config => _ref.read(ConfigService.$);

  void _emit(AudioState state) {
    _state = state;
  }

  void init() async {
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

  void play({bool? isInGame}) {
    if (_state.isBgmOff) return;
    final bool isBgmUrlChanged = 
        isInGame == null ? false : _state.isInGame != isInGame;
    if (_state.isPlaying && !isBgmUrlChanged) return;
    _emit(_state.copyWith(isInGame: isInGame));
    _state.play(position: isBgmUrlChanged ? Duration.zero : null);
  }

  void pause() {
    _state.player.pause();
  }

  void dispose() {
    _state.player.dispose();
  }
}
