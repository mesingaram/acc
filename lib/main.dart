import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await Firebase.initializeApp(
      name: 'db',
      options: FirebaseOptions(
          appId: "1:234570782357:android:7894f78386c330e222ed9c",
          apiKey: "AIzaSyA-GNQUzRfpXuQ_7raeGjWk5r68gWgE3xE",
          messagingSenderId: "234570782357",
          projectId: "newspaper-accounts",
          databaseURL: "https://newspaper-accounts.firebaseio.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Biometric', home: Home());
  }
}
