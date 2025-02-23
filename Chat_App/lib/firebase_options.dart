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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA9VRpwpIKWQ5-Ri_s3J2FnCZLLHwz4DY4',
    appId: '1:147649999779:web:902b4ebc8747bf154c2016',
    messagingSenderId: '147649999779',
    projectId: 'chatapp-9617e',
    authDomain: 'chatapp-9617e.firebaseapp.com',
    storageBucket: 'chatapp-9617e.firebasestorage.app',
    measurementId: 'G-V464VJ5NGD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC73jCtv1_YxKdfcDtB-5_JKtytyoIHVVM',
    appId: '1:147649999779:android:4eb9e15dad02028e4c2016',
    messagingSenderId: '147649999779',
    projectId: 'chatapp-9617e',
    storageBucket: 'chatapp-9617e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV_lI-5-fsVuxFGD64Of8MiBbSlqKqrB4',
    appId: '1:147649999779:ios:2d9266206b01b5a74c2016',
    messagingSenderId: '147649999779',
    projectId: 'chatapp-9617e',
    storageBucket: 'chatapp-9617e.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV_lI-5-fsVuxFGD64Of8MiBbSlqKqrB4',
    appId: '1:147649999779:ios:2d9266206b01b5a74c2016',
    messagingSenderId: '147649999779',
    projectId: 'chatapp-9617e',
    storageBucket: 'chatapp-9617e.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9VRpwpIKWQ5-Ri_s3J2FnCZLLHwz4DY4',
    appId: '1:147649999779:web:585ca23dfe60b38d4c2016',
    messagingSenderId: '147649999779',
    projectId: 'chatapp-9617e',
    authDomain: 'chatapp-9617e.firebaseapp.com',
    storageBucket: 'chatapp-9617e.firebasestorage.app',
    measurementId: 'G-1D26Y6TEEM',
  );

}