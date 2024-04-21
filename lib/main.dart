import 'package:ecommerce_firebase_getx/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Todo: Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  // Todo: Init Local Storage
  // Todo: Await Native Splash

  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Todo: Initialize Authentication

  runApp(new MyApp());
}
