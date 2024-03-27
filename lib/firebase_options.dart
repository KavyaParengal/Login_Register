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
    apiKey: 'AIzaSyDDrqVCZ7k8JvJMAFcT8QoIcZB5Dd2qBlk',
    appId: '1:863574233401:web:25894efddd5fc5805058e8',
    messagingSenderId: '863574233401',
    projectId: 'shebirth-56315',
    authDomain: 'shebirth-56315.firebaseapp.com',
    storageBucket: 'shebirth-56315.appspot.com',
    measurementId: 'G-RYDPEVQEH0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcY5I4qYaF5Ss-Bwbge7hy0diH8Cfjm3E',
    appId: '1:863574233401:android:789772ea880738265058e8',
    messagingSenderId: '863574233401',
    projectId: 'shebirth-56315',
    storageBucket: 'shebirth-56315.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwhSgr-GP11i4uRWAxft8H0Jxr5Xt0RFs',
    appId: '1:863574233401:ios:780b5e948807c7625058e8',
    messagingSenderId: '863574233401',
    projectId: 'shebirth-56315',
    storageBucket: 'shebirth-56315.appspot.com',
    iosClientId: '863574233401-7gh5o7p9h9ms9l8cmcgibrrh5eilmohd.apps.googleusercontent.com',
    iosBundleId: 'com.smartbirth.shebirth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwhSgr-GP11i4uRWAxft8H0Jxr5Xt0RFs',
    appId: '1:863574233401:ios:780b5e948807c7625058e8',
    messagingSenderId: '863574233401',
    projectId: 'shebirth-56315',
    storageBucket: 'shebirth-56315.appspot.com',
    iosClientId: '863574233401-7gh5o7p9h9ms9l8cmcgibrrh5eilmohd.apps.googleusercontent.com',
    iosBundleId: 'com.smartbirth.shebirth',
  );
}