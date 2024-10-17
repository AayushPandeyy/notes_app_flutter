import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_flutter/firebase/AuthService.dart';
import 'package:notes_app_flutter/pages/auth/LoginScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthService().logout();
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
