import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_flutter/constants/ColorsToUse.dart';

class CreateNotesScreen extends StatefulWidget {
  const CreateNotesScreen({super.key});

  @override
  State<CreateNotesScreen> createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  int _selectedBottomBarIndex = 0;
  final List<Widget> bottomBarWidgets = [
    const Icon(Icons.image_rounded),
    const Icon(Icons.format_bold),
    const Icon(Icons.format_italic),
    const Icon(Icons.subdirectory_arrow_left_sharp),
    const Icon(Icons.subdirectory_arrow_right_sharp),
  ];
  String currDate =
      DateFormat("MMM dd , EEE , yyyy  hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.push_pin)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.check))
        ],
      ),
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currDate),
                const TextField(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Start Typing...",
                          hintStyle:
                              TextStyle(color: ColorsToUse().primaryColor),
                          border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
              children: bottomBarWidgets.map((widget) {
                int index = bottomBarWidgets.indexOf(widget);
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
                    child: widget,
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ]),
    );
  }
}
