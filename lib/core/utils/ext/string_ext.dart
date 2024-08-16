extension StringExt on String {
  bool eq(String other, {bool ignoreCase = true}) {
    return ignoreCase ? toLowerCase() == other.toLowerCase() : this == other;
  }

  String ifEmpty(String defaultValue) {
    return isEmpty ? defaultValue : this;
  }
}
