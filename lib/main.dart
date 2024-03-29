import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/firebase_options.dart';
import 'package:raijin/features/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(const MyApp());
}
