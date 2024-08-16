enum SignInMethod {
  google,
  apple,
  anonymous;

  String toJson() => name;

  factory SignInMethod.fromJson(dynamic v) {
    for (final value in values) {
      if (value.name == '$v') {
        return value;
      }
    }
    throw UnsupportedError('Unsupported $v');
  }
}
