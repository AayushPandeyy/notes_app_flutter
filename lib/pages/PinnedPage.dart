import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:notes_app_flutter/firebase/FirestoreService.dart';
import "package:flutter_quill/flutter_quill.dart" as quill;
import 'package:notes_app_flutter/widgets/homePage/NoteBox.dart';

class PinnedPage extends StatefulWidget {
  const PinnedPage({super.key});

  @override
  State<PinnedPage> createState() => _PinnedPageState();
}

class _PinnedPageState extends State<PinnedPage> {
  var _controller = quill.QuillController.basic();
  final FirestoreService service = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: service.getPinnedNotesBasedOnUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white, size: 70),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Pinned Notes"),
            );
          }
          List<Widget> widgets = [];
          for (var data in snapshot.data!) {
            List<dynamic> content = data["content"];
            final quill.Document doc = quill.Document.fromJson(content);

            _controller = quill.QuillController(
              document: doc,
              selection: const TextSelection.collapsed(offset: 0),
            );
            DateTime date = data["timestamp"].toDate();
            String formattedDate = DateFormat('EEE, MMM d, yyyy').format(date);
            widgets.add(
              StaggeredGridTile.fit(
                crossAxisCellCount: 2,
                child: NoteBox(
                  isPinned: data["pinned"],
                  date: formattedDate,
                  content: _controller.document.toPlainText(),
                  controller: _controller,
                  title: data["title"],
                  bgColor: const Color(0xfffaf2ea),
                ),
              ),
            );
          }
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
                    StaggeredGrid.count(
                        crossAxisCount: 4, // Number of columns
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: widgets // Convert Iterable to List
                        )
                  ]),
            ),
          );
        });
  }
}
