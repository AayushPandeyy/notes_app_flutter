import 'package:flutter/material.dart';

class CreateNotesBox extends StatefulWidget {
  const CreateNotesBox({super.key});

  @override
  State<CreateNotesBox> createState() => _CreateNotesBoxState();
}

class _CreateNotesBoxState extends State<CreateNotesBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Start with creating",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "New Note",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Add Note",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
