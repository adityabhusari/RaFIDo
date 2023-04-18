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
    apiKey: 'AIzaSyAHQqVZMz1xrGKBrJXczyKxwoqtxAyWbZ8',
    appId: '1:764410491702:web:ec206f40ce79f8ff6db997',
    messagingSenderId: '764410491702',
    projectId: 'rafido-8216c',
    authDomain: 'rafido-8216c.firebaseapp.com',
    storageBucket: 'rafido-8216c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKHEma61l0tB64Ov3NejvgW7ZahioFURs',
    appId: '1:764410491702:android:9c2f53817b9ec8c96db997',
    messagingSenderId: '764410491702',
    projectId: 'rafido-8216c',
    storageBucket: 'rafido-8216c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2Lu3u4GMGlYd9-kgrAi4g1aJ9Df6ssPo',
    appId: '1:764410491702:ios:9c8990c1b4ac09f86db997',
    messagingSenderId: '764410491702',
    projectId: 'rafido-8216c',
    storageBucket: 'rafido-8216c.appspot.com',
    iosClientId: '764410491702-ssst4c8avsp4m3rot2p3i72llopjlkq5.apps.googleusercontent.com',
    iosBundleId: 'com.crpatil1901.rapido',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2Lu3u4GMGlYd9-kgrAi4g1aJ9Df6ssPo',
    appId: '1:764410491702:ios:bff5735c300706b36db997',
    messagingSenderId: '764410491702',
    projectId: 'rafido-8216c',
    storageBucket: 'rafido-8216c.appspot.com',
    iosClientId: '764410491702-h1d6feqr47kcm0vjrjut8ib425b69vr6.apps.googleusercontent.com',
    iosBundleId: 'com.example.rapido',
  );
}
