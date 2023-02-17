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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyEoCGxwsGeIO3P_9nOHE9VfidU0-OGJk',
    appId: '1:248984767571:android:0ee0be50262d58c084caa6',
    messagingSenderId: '248984767571',
    projectId: 'flutter-f3371',
    databaseURL: 'https://flutter-f3371-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-f3371.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMImSXPVPbVhBpw7uLT7d1o-StVGfozTg',
    appId: '1:248984767571:ios:5e198e014bdbb4fc84caa6',
    messagingSenderId: '248984767571',
    projectId: 'flutter-f3371',
    databaseURL: 'https://flutter-f3371-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-f3371.appspot.com',
    iosClientId: '248984767571-vg1eiad2dlim9n5l577umhpkf82cqdhs.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApplication',
  );
}
