/// Protocol enum values are upper snake case of the Dart enum name.
/// `lightGreen` <-> `LIGHT_GREEN`
String toWire(Enum value) => value.name
    .replaceAllMapped(RegExp('[A-Z]'), (m) => '_${m[0]}')
    .toUpperCase();

/// Returns null for an unknown value.
T? fromWire<T extends Enum>(List<T> values, Object? wire) {
  for (final value in values) {
    if (toWire(value) == wire) return value;
  }
  return null;
}

/// Throws [FormatException] for an unknown value.
T requireWire<T extends Enum>(List<T> values, Object? wire) {
  return fromWire(values, wire) ??
      (throw FormatException('Unknown ${T.toString()} value', wire));
}

DateTime epochMs(Object? json) =>
    DateTime.fromMillisecondsSinceEpoch((json as num).toInt());

typedef Json = Map<String, dynamic>;
