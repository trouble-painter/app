import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trouble_painter/features/auth/domain/entities/id_token.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    required Jwt jwt,
    required IdToken idToken,
    required SignInMethod signInMethod,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
