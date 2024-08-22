import 'dart:convert';

import 'package:x_pr/features/game/data/models/x/raw/x_game_raw_state.dart';

class XGameRaw {
  final XGameRawStatus status;
  final String action;
  final Map<String, dynamic> data;

  const XGameRaw({
    required this.status,
    required this.action,
    required this.data,
  });

  factory XGameRaw.fromServer(String text) {
    final firstIndex = text.indexOf('\n');
    final secondIndex = text.indexOf('\n', firstIndex + 1);
    return XGameRaw(
      status: XGameRawStatus.fromJson(
        text.substring(0, firstIndex),
      ),
      action: text.substring(firstIndex + 1, secondIndex),
      data: jsonDecode(
        text.substring(secondIndex + 1),
      ),
    );
  }

  @override
  String toString() => 'GameRes(status: $status, action: $action, data: $data)';
}
