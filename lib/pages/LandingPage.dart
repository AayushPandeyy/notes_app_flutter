import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_flutter/widgets/homePage/CreateNotesBox.dart';
import 'package:notes_app_flutter/widgets/homePage/NoteBox.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  final List<String> tags = [
    "All",
    "Personal",
    "Finance",
    "Home",
    "Work",
    "Important"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Taskly",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Text(
              "Good Morning, Username",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: tags.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: _selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                tags[index],
                                style: TextStyle(
                                  color: _selectedIndex != index
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            StaggeredGrid.count(
                crossAxisCount: 4, // Number of columns
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: const [
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2, child: CreateNotesBox()),
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: NoteBox(
                        bgColor: Color(0xfffaf2ea),
                      )),
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: NoteBox(
                        bgColor: Color(0xffe4def7),
                      )),
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: NoteBox(
                        bgColor: Color(0xffffdf75),
                      )),
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: NoteBox(
                        bgColor: Color(0xffffd3d3),
                      )),
                  StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: NoteBox(
                        bgColor: Color(0xffc3d3d8),
                      )),
                ])
          ],
        ),
      ),
    );
  }
}
