import 'package:firebase_core/firebase_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trouble_painter/.env/dev/firebase_options.dart';
import 'package:trouble_painter/core/utils/env/env.dart';
import 'package:trouble_painter/core/utils/env/flavor.dart';
import 'package:trouble_painter/main.dart' as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(fileName: Flavor.dev.envPath).then((_) {
      Env.load(dotenv.env);
    }),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);

  app.main();
}
