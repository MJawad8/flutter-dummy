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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAxC-Q7C9q0mgtfeAlJCeRY5nv6o7_id5Q',
    appId: '1:100051814221:web:5cc2100613557e52ffd904',
    messagingSenderId: '100051814221',
    projectId: 'flutter-web-d74e6',
    authDomain: 'flutter-web-d74e6.firebaseapp.com',
    storageBucket: 'flutter-web-d74e6.appspot.com',
    measurementId: 'G-P77C8N2S3Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxD3aT8-21DDNsRM5gpTGao5uHpA9-ZaE',
    appId: '1:100051814221:android:d1f2003171fa1e1cffd904',
    messagingSenderId: '100051814221',
    projectId: 'flutter-web-d74e6',
    storageBucket: 'flutter-web-d74e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1R2dg33QcYNJsLlysLCO_ppvtGxmC4qo',
    appId: '1:100051814221:ios:8744796c36ff2fc0ffd904',
    messagingSenderId: '100051814221',
    projectId: 'flutter-web-d74e6',
    storageBucket: 'flutter-web-d74e6.appspot.com',
    iosClientId: '100051814221-8ut6i5jcdi56aj50mngkp5e3h89kcq2d.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterweb',
  );
}
