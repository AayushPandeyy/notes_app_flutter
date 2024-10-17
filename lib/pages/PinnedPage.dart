import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_flutter/widgets/homePage/NoteBox.dart';

class PinnedPage extends StatefulWidget {
  const PinnedPage({super.key});

  @override
  State<PinnedPage> createState() => _PinnedPageState();
}

class _PinnedPageState extends State<PinnedPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Pinned Notes",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.push_pin,
                  color: Colors.white,
                  size: 24,
                )
              ],
            ),
            const Text(
              "Notes that you previously marked as pinned will appear here.",
              style: TextStyle(fontSize: 16, color: Colors.white),
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
            
                // children: const [
                //   StaggeredGridTile.fit(
                //       crossAxisCellCount: 2,
                //       child: NoteBox(
                //         bgColor: Color(0xfffaf2ea),
                //       )),
                //   StaggeredGridTile.fit(
                //       crossAxisCellCount: 2,
                //       child: NoteBox(
                //         bgColor: Color(0xffe4def7),
                //       )),
                //   StaggeredGridTile.fit(
                //       crossAxisCellCount: 2,
                //       child: NoteBox(
                //         bgColor: Color(0xffffdf75),
                //       )),
                //   StaggeredGridTile.fit(
                //       crossAxisCellCount: 2,
                //       child: NoteBox(
                //         bgColor: Color(0xffffd3d3),
                //       )),
                //   StaggeredGridTile.fit(
                //       crossAxisCellCount: 2,
                //       child: NoteBox(
                //         bgColor: Color(0xffc3d3d8),
                //       )),
                // ])
          
        ]),
      ),
    );
  }
}
