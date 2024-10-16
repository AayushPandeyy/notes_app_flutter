import 'package:flutter/material.dart';
import 'package:notes_app_flutter/constants/ColorsToUse.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          // Handle back button
                        },
                      ),
                      const Text("Back"),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Robot icon and login text
                  const Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.android_outlined,
                            size: 50,
                            color: Color(0xFF6A4CFF),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username TextField
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login button
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6A4CFF),
                      ),
                      child: const Text('LOGIN'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // OR text and divider
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Google sign-in button
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png'),
                        iconSize: 30,
                        onPressed: () {
                          // Handle Google sign-in
                        },
                      ),
                    ),
                  ),
                ],
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
