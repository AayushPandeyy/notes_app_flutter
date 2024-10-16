import 'package:flutter/material.dart';
import 'package:notes_app_flutter/constants/ColorsToUse.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsToUse().primaryColor,
      // appBar: const PreferredSize(
      //     preferredSize: Size(100, 40),
      //     child: Padding(
      //       padding: EdgeInsets.all(8.0),
      //       child: Row(
      //         children: [Icon(Icons.arrow_back), Text("Back")],
      //       ),
      //     )),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ClipPath(
            clipper: SecondDiagonalClipper(),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
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
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Username",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                TextField(
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
                    "Email",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                TextField(
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
                Container(
                  width: 122,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: ColorsToUse().primaryColor),
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
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Already Have an Account?\nLogin Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}

// Custom clipper for the diagonal design
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.55, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(size.width, size.height * 0.75);

    path.lineTo(size.width * 0.5, size.height);

    path.lineTo(size.width, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
