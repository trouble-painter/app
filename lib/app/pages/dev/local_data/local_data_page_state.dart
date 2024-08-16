import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';

class LocalDataPageState {
  final Config config;
  final AuthState? authState;

  const LocalDataPageState({
    required this.config,
    required this.authState,
  });
}
