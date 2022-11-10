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
    apiKey: 'AIzaSyAGSwxjQKIygc4GHoNgh8gJJ_L-QixEhDI',
    appId: '1:278843445249:web:6b4b983008d4d3c4077000',
    messagingSenderId: '278843445249',
    projectId: 'ecosystem-c1cdc',
    authDomain: 'ecosystem-c1cdc.firebaseapp.com',
    storageBucket: 'ecosystem-c1cdc.appspot.com',
    measurementId: 'G-Y7T7NV1WMT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiRDuf7j2lmQF-nu2CfUM1WzgUcFg30l4',
    appId: '1:278843445249:android:f7894dc46da9d15c077000',
    messagingSenderId: '278843445249',
    projectId: 'ecosystem-c1cdc',
    storageBucket: 'ecosystem-c1cdc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhaW7_R0u4nGIxsWGEXG2L3WpiArtoV70',
    appId: '1:278843445249:ios:218bf2aa53d51f7d077000',
    messagingSenderId: '278843445249',
    projectId: 'ecosystem-c1cdc',
    storageBucket: 'ecosystem-c1cdc.appspot.com',
    iosClientId: '278843445249-6r835cblg55bpri5l18bgdfomsai1hq3.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecoSystem',
  );
}