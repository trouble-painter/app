/// Game server clock.
/// Every game time from the server is on this clock (protocol v2 "시계 보정").
class ServerTime {
  static Duration _offset = Duration.zero;

  /// Call with `HELLO.serverTime` right after it arrives.
  static void sync(DateTime serverTime) {
    _offset = serverTime.difference(DateTime.now());
  }

  /// Current time on the server clock
  static DateTime get now => DateTime.now().add(_offset);
}
