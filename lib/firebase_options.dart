// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDDazw4ldYMpP0yXYpesWeLJNdMELmNKTg',
    appId: '1:1094793617440:web:702d1b2050e4e24b07dc45',
    messagingSenderId: '1094793617440',
    projectId: 'jibliya-274b9',
    authDomain: 'jibliya-274b9.firebaseapp.com',
    storageBucket: 'jibliya-274b9.appspot.com',
    measurementId: 'G-HJ93D81VB2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDq3FYEAGNRPlnZw1i5VyJnQi7TeTKS0Hg',
    appId: '1:1094793617440:android:d76220e304b9afc607dc45',
    messagingSenderId: '1094793617440',
    projectId: 'jibliya-274b9',
    storageBucket: 'jibliya-274b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS6LQ5v55X8UBA0LzBMuJv2UB-ok9z1SE',
    appId: '1:1094793617440:ios:ac0b58717dd0fec007dc45',
    messagingSenderId: '1094793617440',
    projectId: 'jibliya-274b9',
    storageBucket: 'jibliya-274b9.appspot.com',
    iosClientId: '1094793617440-lfm177r27lsn3gcgd4uo3mnmb3a8p9mp.apps.googleusercontent.com',
    iosBundleId: 'com.devnejim.jibliya',
  );
}
