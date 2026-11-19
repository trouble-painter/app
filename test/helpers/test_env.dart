import 'package:trouble_painter/core/utils/env/env.dart';

bool _isLoaded = false;

/// [Env] fields are `late final`, so load them only once per test process.
void loadTestEnv() {
  if (_isLoaded) return;
  _isLoaded = true;
  Env.load({
    'FLAVOR': 'dev',
    'BASE_URL': 'https://example.com',
    'BASE_SOCKET_URL': 'wss://example.com',
    'ERROR_WEBHOOK_URL': 'https://example.com/webhook',
    'INVITE_URL': 'https://example.com/invite',
    'AOS_GOOGLE_CLIENT_ID': '',
    'IOS_GOOGLE_CLIENT_ID': '',
  });
}
