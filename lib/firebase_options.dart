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
    apiKey: 'AIzaSyBIOhUfJ3pENBV15A62u3Ala2EtlGYSAaM',
    appId: '1:761479022713:web:65ec964da5b117d4f06ca8',
    messagingSenderId: '761479022713',
    projectId: 'tareas-4694b',
    authDomain: 'tareas-4694b.firebaseapp.com',
    storageBucket: 'tareas-4694b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrH9N_XK472OYhxJDaNo9KvKL1rUqeeMM',
    appId: '1:761479022713:android:07d2999dfbb28593f06ca8',
    messagingSenderId: '761479022713',
    projectId: 'tareas-4694b',
    storageBucket: 'tareas-4694b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqDcAXrnWtBj8OO4cs78EU1w6Qvq9IWjc',
    appId: '1:761479022713:ios:cb86e5770ea0f9aaf06ca8',
    messagingSenderId: '761479022713',
    projectId: 'tareas-4694b',
    storageBucket: 'tareas-4694b.appspot.com',
    iosBundleId: 'com.example.tareasFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqDcAXrnWtBj8OO4cs78EU1w6Qvq9IWjc',
    appId: '1:761479022713:ios:cb86e5770ea0f9aaf06ca8',
    messagingSenderId: '761479022713',
    projectId: 'tareas-4694b',
    storageBucket: 'tareas-4694b.appspot.com',
    iosBundleId: 'com.example.tareasFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIOhUfJ3pENBV15A62u3Ala2EtlGYSAaM',
    appId: '1:761479022713:web:e56ea33d676fdc3af06ca8',
    messagingSenderId: '761479022713',
    projectId: 'tareas-4694b',
    authDomain: 'tareas-4694b.firebaseapp.com',
    storageBucket: 'tareas-4694b.appspot.com',
  );

}