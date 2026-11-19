import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/wire.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

void main() {
  group('wire', () {
    test('converts enum names to upper snake case', () {
      expect(toWire(ClientMessageType.createRoom), 'CREATE_ROOM');
      expect(toWire(ServerMessageType.answerTyping), 'ANSWER_TYPING');
      expect(toWire(PlayerColor.lightGreen), 'LIGHT_GREEN');
      expect(toWire(ProtocolLocale.ko), 'KO');
    });

    test('parses every value back', () {
      for (final values in <List<Enum>>[
        ClientMessageType.values,
        ServerMessageType.values,
        PlayerColor.values,
        ProtocolErrorCode.values,
        IdleReason.values,
        PhaseType.values,
        ProtocolReaction.values,
      ]) {
        for (final value in values) {
          expect(fromWire(values, toWire(value)), value);
        }
      }
    });

    test('returns null or throws for an unknown value', () {
      expect(fromWire(PhaseType.values, 'NOPE'), isNull);
      expect(
        () => requireWire(PhaseType.values, 'NOPE'),
        throwsFormatException,
      );
    });
  });
}
