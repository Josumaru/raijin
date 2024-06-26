// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwkJJG28mDv6DTr3MVUVUTcn6SdUixtR4',
    appId: '1:1003322038018:web:8607b7037fc63e0343d41b',
    messagingSenderId: '1003322038018',
    projectId: 'raijinime',
    authDomain: 'raijinime.firebaseapp.com',
    storageBucket: 'raijinime.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrr2F53fPwQjT3IjOenY6lWY7jAL4kFEY',
    appId: '1:1003322038018:android:3a45665d6d6f2f9d43d41b',
    messagingSenderId: '1003322038018',
    projectId: 'raijinime',
    storageBucket: 'raijinime.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-U5QCNOZMtn9p3Z9liYOTRi5ed-E5L08',
    appId: '1:1003322038018:ios:e758c09cd001727643d41b',
    messagingSenderId: '1003322038018',
    projectId: 'raijinime',
    storageBucket: 'raijinime.appspot.com',
    iosBundleId: 'com.example.raijin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-U5QCNOZMtn9p3Z9liYOTRi5ed-E5L08',
    appId: '1:1003322038018:ios:04a79d0d3302a4f343d41b',
    messagingSenderId: '1003322038018',
    projectId: 'raijinime',
    storageBucket: 'raijinime.appspot.com',
    iosBundleId: 'com.example.raijin.RunnerTests',
  );
}
