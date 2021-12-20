import 'package:flutter/material.dart';
import 'package:live_easy/screens/language_selection.dart';
import 'package:live_easy/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_easy/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Liveasy",
      home: LanguageSelection(),
    );
  }
}