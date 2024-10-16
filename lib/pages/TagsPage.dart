import 'package:flutter/material.dart';
import 'package:notes_app_flutter/widgets/tagsScreen/TagTile.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Tags",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.tag,
                  color: Colors.white,
                  size: 24,
                )
              ],
            ),
            const Text(
              "#'s that you have created will appear here",
              textAlign: TextAlign.start,
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
            const Wrap(
              children: [
                TagTile(
                  tagName: "tag1",
                ),
                TagTile(
                  tagName: "notes",
                ),
                TagTile(
                  tagName: "daily",
                ),
                TagTile(
                  tagName: "today",
                ),
                TagTile(
                  tagName: "random",
                ),
                TagTile(
                  tagName: "hashtag",
                ),
                TagTile(
                  tagName: "so",
                ),
                TagTile(
                  tagName: "hawa",
                ),
                TagTile(
                  tagName: "huri",
                ),
                TagTile(
                  tagName: "random",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
