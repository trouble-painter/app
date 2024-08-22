enum XGameRawStatus {
  ok,
  error;

  @override
  String toString() => switch (this) {
        ok => 'OK',
        error => 'ERROR',
      };

  factory XGameRawStatus.fromJson(dynamic json) => switch (json) {
        'OK' => ok,
        'ERROR' => error,
        _ => throw UnsupportedError('$json is not supported.'),
      };
}
