import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_flutter/pages/HomePage.dart';
import 'package:notes_app_flutter/pages/auth/LoginScreen.dart';

class LoginChecker extends StatelessWidget {
  const LoginChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check the connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if there is an error
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }

          // Check if user data is available
          if (snapshot.hasData) {
            // If user is authenticated, navigate to MainPage
            return const HomePage();
          } else {
            // If user is not authenticated, navigate to SignInScreen
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
