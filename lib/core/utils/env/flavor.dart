enum Flavor {
  dev,
  prod;

  String get envPath => 'lib/.env/$name/.env';
  bool get isDev => this == dev;

  factory Flavor.fromString(String v) {
    for (final flavor in values) {
      if (v == flavor.name) return flavor;
    }
    throw Exception('Invalid flavor error');
  }

  @override
  String toString() => name;
}
