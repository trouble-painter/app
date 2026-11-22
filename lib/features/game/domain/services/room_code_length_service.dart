import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/debug_ui_usecase.dart';
import 'package:trouble_painter/features/game/domain/usecases/get_room_code_length_usecase.dart';

/// Length of the invitation code, which only the server decides.
/// Fetched once and kept; a failure is not kept, so the next read retries.
abstract class RoomCodeLengthService {
  static final $ = FutureProvider<int>((ref) async {
    /// No server in UI test mode
    if (ref.read(ConfigService.$).isUiTestMode) {
      return DebugUiUsecase.roomCodeLength;
    }
    final result = await ref.read(GetRoomCodeLengthUsecase.$).call(null);
    return switch (result) {
      Success(value: final length) => length,
      Failure(e: final e) => throw e,
      Cancel() => throw StateError('Room code length request canceled'),
    };
  });
}
