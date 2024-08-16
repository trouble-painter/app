import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class AudioService {
  static final $ = Provider<AudioService>((ref) {
    return AudioService(ref: ref);
  });

  AudioService({
    required ProviderRef<AudioService> ref,
  }) : _ref = ref;

  final ProviderRef<AudioService> _ref;
  late final AudioPlayer _player = AudioPlayer()..setLoopMode(LoopMode.all);
  Config get config => _ref.read(ConfigService.$);

  void init() async {
    final session = await AudioSession.instance;
    await session.configure(
      const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.ambient,
      ),
    );
    await session.setActive(true);

    _ref.listen(ConfigService.$, (previous, next) {
      if (config.isBgmDisabled) {
        /// Bgm disabled
        stop();
        _player.seek(Duration.zero);
        return;
      }

      if (config.isBgmMute && _player.playing) {
        /// Mute
        pause();
      }

      if (!config.isBgmMute && !_player.playing) {
        /// Play
        play();
      }

      if (previous?.bgmUrl != next.bgmUrl) {
        /// Bgm url changed
        setBgm(next.bgmUrl);
      }
    });
    setBgm(config.bgmUrl);
  }

  Future<void> setBgm(String bgmUrl) async {
    Logger.d("🎶 BGM : $bgmUrl");
    final isPlaying = _player.playerState.playing;
    if (isPlaying) {
      _player.stop();
    }
    await _player.setUrl(bgmUrl);
    if (isPlaying) {
      _player.play();
    }
  }

  void play() {
    if (config.isBgmDisabled || config.isBgmMute) return;
    Logger.d("🎶 BGM : Play");
    _player.play();
  }

  void pause() {
    _player.pause();
  }

  void stop() {
    _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
