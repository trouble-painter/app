import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:x_pr/.env/prod/firebase_options.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/utils/env/flavor.dart';
import 'package:x_pr/main.dart' as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(fileName: Flavor.prod.envPath).then((_) {
      Env.load(dotenv.env);
    }),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);

  app.main();
}
