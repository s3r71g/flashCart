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
    apiKey: 'AIzaSyDV18FALuD7QWcOGeOmkjOdb4YljhX4L4E',
    appId: '1:546090213516:web:548918df2a88baae49dba9',
    messagingSenderId: '546090213516',
    projectId: 'happy-mart-598bf',
    authDomain: 'happy-mart-598bf.firebaseapp.com',
    storageBucket: 'happy-mart-598bf.appspot.com',
    measurementId: 'G-LGFPWCN3E4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2_FnmL5ApeNBioMNnwjT-1qJBwf2j7DE',
    appId: '1:546090213516:android:bc78d8c77592cbde49dba9',
    messagingSenderId: '546090213516',
    projectId: 'happy-mart-598bf',
    storageBucket: 'happy-mart-598bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGjZ_16Eyd_r2v-EOJC-w1BexCy4W_-AI',
    appId: '1:546090213516:ios:27e965e05d5c5e3849dba9',
    messagingSenderId: '546090213516',
    projectId: 'happy-mart-598bf',
    storageBucket: 'happy-mart-598bf.appspot.com',
    iosBundleId: 'com.example.flashCart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGjZ_16Eyd_r2v-EOJC-w1BexCy4W_-AI',
    appId: '1:546090213516:ios:0e15f5021100c0ce49dba9',
    messagingSenderId: '546090213516',
    projectId: 'happy-mart-598bf',
    storageBucket: 'happy-mart-598bf.appspot.com',
    iosBundleId: 'com.example.flashCart.RunnerTests',
  );
}