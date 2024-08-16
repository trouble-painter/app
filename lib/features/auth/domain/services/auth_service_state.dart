part of 'auth_service.dart';

sealed class AuthServiceState {
  const AuthServiceState();
}

class Unauthenticated extends AuthServiceState {
  const Unauthenticated();
}

class Authenticated extends AuthServiceState {
  final AuthState authState;

  const Authenticated(this.authState);
  @override
  String toString() => 'Authenticated(authState: $authState)';

  Authenticated copyWith({
    AuthState? authState,
  }) {
    return Authenticated(
      authState ?? this.authState,
    );
  }
}
