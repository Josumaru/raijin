import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/firebase_options.dart';
import 'package:raijin/features/my_app.dart';

Future<void> main() async {
  // binding to be initialized before calling [runApp].
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Init flutter native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Init the new firebase instance
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // remove the splash screen
  FlutterNativeSplash.remove();
  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
    // optional: set to false to disable printing logs to console (default: true)
    debug: true,
    // optional: set to false to disable working with http links (default: false)
    ignoreSsl: false,
  );
  // init dependecy injection
  init();
  // run and inflate the given widget and attach it to the screen.
  runApp(const MyApp());
}
