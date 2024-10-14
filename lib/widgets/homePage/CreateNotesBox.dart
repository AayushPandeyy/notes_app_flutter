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
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                const Text(
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
