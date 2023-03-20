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
    apiKey: 'AIzaSyBEZUVX4QRY0nTkdaWNHPwak99Wq-Qr3GY',
    appId: '1:125702849867:web:afe7e55f52e732fc9594ce',
    messagingSenderId: '125702849867',
    projectId: 'chat-app-4a0f0',
    authDomain: 'chat-app-4a0f0.firebaseapp.com',
    storageBucket: 'chat-app-4a0f0.appspot.com',
    measurementId: 'G-JDJZ2C5N78',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAjFvfTz90Z8w9-AyAMq12Ej6xYE-Kg2E',
    appId: '1:125702849867:android:b3d1dda7af878dd79594ce',
    messagingSenderId: '125702849867',
    projectId: 'chat-app-4a0f0',
    storageBucket: 'chat-app-4a0f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmxTTI-Uv2uI2sK6cXPFFhmgA3ctg5eOk',
    appId: '1:125702849867:ios:ee78a9f4beb6605b9594ce',
    messagingSenderId: '125702849867',
    projectId: 'chat-app-4a0f0',
    storageBucket: 'chat-app-4a0f0.appspot.com',
    iosClientId: '125702849867-1l6gijk17o7pfsdv4d57mb7ise6jv8ko.apps.googleusercontent.com',
    iosBundleId: 'com.amarin.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmxTTI-Uv2uI2sK6cXPFFhmgA3ctg5eOk',
    appId: '1:125702849867:ios:665dca6b9bb60f059594ce',
    messagingSenderId: '125702849867',
    projectId: 'chat-app-4a0f0',
    storageBucket: 'chat-app-4a0f0.appspot.com',
    iosClientId: '125702849867-rkc3053m2uarnifa5a2qduha2a41lh2k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
