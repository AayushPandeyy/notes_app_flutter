import 'package:flutter/material.dart';

class TagTile extends StatefulWidget {
  const TagTile({super.key});

  @override
  State<TagTile> createState() => _TagTileState();
}

class _TagTileState extends State<TagTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Tag"),
      ),
    );
  }
}
