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
    apiKey: 'AIzaSyBCn56dwlYzdjdtoJpyBH2Hqk1nmzZyF78',
    appId: '1:1043081789847:web:322d30581817fe627804d2',
    messagingSenderId: '1043081789847',
    projectId: 'project-jh-b3891',
    authDomain: 'project-jh-b3891.firebaseapp.com',
    storageBucket: 'project-jh-b3891.appspot.com',
    measurementId: 'G-HND3FSZ9MZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEDWkjARLiqRBWzkgYucfWJrwZb-1kjzY',
    appId: '1:1043081789847:android:0b78145edd12b83f7804d2',
    messagingSenderId: '1043081789847',
    projectId: 'project-jh-b3891',
    storageBucket: 'project-jh-b3891.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiXUuD00Td1U445NU1r69ULVjPZpeBeJw',
    appId: '1:1043081789847:ios:de64d6759a6c0a117804d2',
    messagingSenderId: '1043081789847',
    projectId: 'project-jh-b3891',
    storageBucket: 'project-jh-b3891.appspot.com',
    iosClientId: '1043081789847-ddtgcqecfjs382k5kt5kd67lf8fi0mlo.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectJh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiXUuD00Td1U445NU1r69ULVjPZpeBeJw',
    appId: '1:1043081789847:ios:de64d6759a6c0a117804d2',
    messagingSenderId: '1043081789847',
    projectId: 'project-jh-b3891',
    storageBucket: 'project-jh-b3891.appspot.com',
    iosClientId: '1043081789847-ddtgcqecfjs382k5kt5kd67lf8fi0mlo.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectJh',
  );
}