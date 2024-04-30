import 'package:bliguh/app.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  //  Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // await SharedPreferences.getInstance();
  await GetStorage.init();

  /// Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///-- Initialize Firebase & Authentication Repository
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuhenticationRepository()));
  // Todo: Initialize Authentication

  runApp(new MyApp());
}
