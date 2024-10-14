import 'package:flutter/material.dart';
import 'package:notes_app_flutter/pages/CreateNotesScreen.dart';
import 'package:notes_app_flutter/pages/LandingPage.dart';
import 'package:notes_app_flutter/pages/PinnedPage.dart';
import 'package:notes_app_flutter/pages/ProfilePage.dart';
import 'package:notes_app_flutter/pages/TagsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomBarIndex = 0;
  List<Widget> pages = [
    const LandingPage(),
    const PinnedPage(),
    const CreateNotesScreen(),
    const TagsPage(),
    const ProfilePage()
  ];
  final List<Icon> bottomBarIcons = [
    const Icon(Icons.home),
    const Icon(Icons.push_pin_outlined),
    const Icon(Icons.add),
    const Icon(Icons.tag),
    const Icon(Icons.person)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff1a434e),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          pages[_selectedBottomBarIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(right: 24, bottom: 24, left: 24),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: bottomBarIcons.map((icon) {
                  int index = bottomBarIcons.indexOf(icon);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedBottomBarIndex = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _selectedBottomBarIndex == index
                              ? const Color(0xffd9d9d9)
                              : Colors.transparent),
                      child: icon,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
