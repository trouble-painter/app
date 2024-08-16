sealed class Result<S> {
  const Result();

  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
  bool get isCancel => this is Cancel;
}

class Success<S> extends Result<S> {
  const Success(this.value);
  final S value;

  @override
  String toString() => 'Success(value: $value)';
}

class Failure<S> extends Result<S> {
  const Failure([Object? e]) : e = e ?? false as Object;
  final Object e;

  @override
  String toString() => 'Failure(e: $e)';
}

class Cancel<S> extends Result<S> {
  const Cancel();
}
