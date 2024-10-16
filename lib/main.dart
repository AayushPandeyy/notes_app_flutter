import 'package:flutter/material.dart';
import 'package:notes_app_flutter/Example.dart';
import 'package:notes_app_flutter/pages/HomePage.dart';
import 'package:notes_app_flutter/pages/auth/LoginScreen.dart';
import 'package:notes_app_flutter/pages/auth/SignUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
