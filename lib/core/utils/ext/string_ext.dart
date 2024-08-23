extension StringExt on String {
  bool eq(String other, {bool ignoreCase = true}) {
    return ignoreCase ? toLowerCase() == other.toLowerCase() : this == other;
  }

  String ifEmpty(String defaultValue) {
    return isEmpty ? defaultValue : this;
  }

  String toLowerFirst() {
    return isEmpty ? this : this[0].toLowerCase() + substring(1);
  }

  String toSnakeCase() {
  final snakeCase = replaceAllMapped(
    RegExp(r'[A-Z]'),
    (Match match) => '_${match.group(0)!.toLowerCase()}',
  );
  return snakeCase.startsWith('_') ? snakeCase.substring(1) : snakeCase;
}
}
