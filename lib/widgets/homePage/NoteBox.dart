import 'package:flutter/material.dart';

class NoteBox extends StatefulWidget {
  final Color bgColor;
  const NoteBox({super.key, required this.bgColor});

  @override
  State<NoteBox> createState() => _NoteBoxState();
}

class _NoteBoxState extends State<NoteBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
          color: widget.bgColor, borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    "Title of the note ",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
                style: TextStyle(fontSize: 12),
                "This is a testing note and just to take space the text is being written here and this text contains no meaning as life of mine and this test is trash just like my skills in UI/UX but one mans trash is another mans.....This is a testing note and just to take space the text is being written here and this text contains no meaning as life of mine and this test is trash just like my skills in UI/UX but one mans trash is another mans.....This is a testing note and just to take space the text is being written here and this text contains no meaning as life of mine and this test is trash just like my skills in UI/UX but one mans trash is another mans..... This is a testing note and just to take space the text is being written here and this text contains no meaning as life of mine and this test is trash just like my skills in UI/UX but one mans trash is another mans....."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sun, Oct 14, 2024"),
                Icon(
                  Icons.push_pin,
                  size: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
