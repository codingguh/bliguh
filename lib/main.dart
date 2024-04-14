import 'package:ecommerce_firebase_getx/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Todo: Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication

  runApp(new MyApp());
}
