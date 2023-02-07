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
    apiKey: 'AIzaSyCl5zRcQqiDlGaRPPJpqnVIg-5qNFCEIXM',
    appId: '1:853443310118:web:3f49fbe36a85584dc32ce7',
    messagingSenderId: '853443310118',
    projectId: 'todo-app-3d2b6',
    authDomain: 'todo-app-3d2b6.firebaseapp.com',
    storageBucket: 'todo-app-3d2b6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAI-VmdlBs4-q2i6BBIhyKMtobuEa3tVRY',
    appId: '1:853443310118:android:97c1008d424bd0dec32ce7',
    messagingSenderId: '853443310118',
    projectId: 'todo-app-3d2b6',
    storageBucket: 'todo-app-3d2b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPYE6QnJ8Pwny4JthsCemlQxTmKXUM2T8',
    appId: '1:853443310118:ios:d707573ac16e2880c32ce7',
    messagingSenderId: '853443310118',
    projectId: 'todo-app-3d2b6',
    storageBucket: 'todo-app-3d2b6.appspot.com',
    iosClientId: '853443310118-5mh2r0kcv8162cde5o5147rmflhiiloi.apps.googleusercontent.com',
    iosBundleId: 'com.example.exampleBlocPattern',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPYE6QnJ8Pwny4JthsCemlQxTmKXUM2T8',
    appId: '1:853443310118:ios:d707573ac16e2880c32ce7',
    messagingSenderId: '853443310118',
    projectId: 'todo-app-3d2b6',
    storageBucket: 'todo-app-3d2b6.appspot.com',
    iosClientId: '853443310118-5mh2r0kcv8162cde5o5147rmflhiiloi.apps.googleusercontent.com',
    iosBundleId: 'com.example.exampleBlocPattern',
  );
}