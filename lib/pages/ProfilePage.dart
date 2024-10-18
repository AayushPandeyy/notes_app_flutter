import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_flutter/constants/ColorsToUse.dart';
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
      backgroundColor: ColorsToUse().primaryColor,
      body: Column(
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
          Container(
            // width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_octagon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Remove Ads",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ProfileBox("Personal Information", Icons.person),
              const SizedBox(
                height: 5,
              ),
              ProfileBox("Sync", Icons.cloud),
              const SizedBox(
                height: 5,
              ),
              ProfileBox("Share With Friends", Icons.send),
              const SizedBox(
                height: 5,
              ),
              ProfileBox("Rate Us", CupertinoIcons.star)
            ],
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthService().logout();
                Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ProfileBox(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 59,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    ),
  );
}
