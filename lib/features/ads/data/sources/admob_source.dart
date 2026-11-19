import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/features/ads/data/models/admob/admob_reward_ads.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class AdmobSource {
  static final $ = Provider.autoDispose<AdmobSource>((ref) {
    return AdmobSource(
      configGetter: () => ref.read(ConfigService.$),
    );
  });
  AdmobSource({
    required Config Function() configGetter,
  }) : _configGetter = configGetter;

  final Config Function() _configGetter;
  Config get _config => _configGetter();

  AdmobRewardAds getQuickStartRewardAds() {
    return AdmobRewardAds(
      appId: _config.admob.appId,
      adsId: _config.admob.quickStartRewardId,
    );
  }
}
