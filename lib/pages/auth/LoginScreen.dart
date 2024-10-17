import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_flutter/constants/ColorsToUse.dart';
import 'package:notes_app_flutter/firebase/AuthService.dart';
import 'package:notes_app_flutter/pages/HomePage.dart';
import 'package:notes_app_flutter/pages/auth/SignUpScreen.dart';
import 'package:notes_app_flutter/utilities/DialogBox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService();

  void login(BuildContext context) async {
    final AuthService authService = AuthService();

    try {
      DialogBox().showLoadingDialog(context, "Signing In");

      UserCredential user = await authService.signIn(
        emailController.text,
        passwordController.text,
      );

      if (!user.user!.emailVerified) {
        Navigator.pop(context);
        await authService.logout();
        DialogBox().showAlertDialog(context, "Email Verification Required",
            "Your email has not yet been verified. Please verify your email and try again.");
      } else {
        Navigator.pop(context);
        _resetFields();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address format.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many login attempts. Please try again later.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }

      DialogBox().showAlertDialog(context, "Login Failed", errorMessage);
    } catch (e) {
      print(e);
      Navigator.pop(context);
      DialogBox().showAlertDialog(context, "Login Failed",
          "An unknown error occurred.Please try again");
    }
  }

  void _resetFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsToUse().primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Background with diagonal cut
            ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                color: Colors.white, // Purple background
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            ClipPath(
              clipper: SecondDiagonalClipper(),
              child: Container(
                color: Colors.white, // Purple background
                height: double.infinity,
                width: double.infinity,
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.android_outlined,
                          size: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          login(context);
                        },
                        child: Container(
                          width: 122,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: ColorsToUse().primaryColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 125,
                            height: 1,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 125,
                            height: 1,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image(
                            image: NetworkImage(
                                "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Dont Have an Account?\nRegister Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper for the diagonal design
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.55, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SecondDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(size.width, size.height * 0.70);

    path.lineTo(size.width * 0.5, size.height);

    path.lineTo(size.width, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
