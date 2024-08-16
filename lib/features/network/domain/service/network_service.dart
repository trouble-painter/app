import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/network/domain/entity/network_state.dart';

class NetworkService extends Notifier<NetworkState> {
  static final $ = NotifierProvider<NetworkService, NetworkState>(
    NetworkService.new,
  );

  void init() {
    final subs = Connectivity().onConnectivityChanged.listen((result) {
      state = result.contains(ConnectivityResult.none)
          ? NetworkState.disconnected
          : NetworkState.connected;
    });
    ref.onDispose(subs.cancel);
  }

  @override
  NetworkState build() {
    return NetworkState.disconnected;
  }
}
