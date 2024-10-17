import 'package:flutter/material.dart';
import "package:flutter_quill/flutter_quill.dart" as quill;

class NoteBox extends StatefulWidget {
  final String title;
  final String content;
  final quill.QuillController controller;
  final String date;
  final Color bgColor;
  final bool isPinned;
  const NoteBox({
    super.key,
    required this.bgColor,
    required this.title,
    required this.controller,
    required this.content,
    required this.date,
    required this.isPinned,
  });

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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
                    widget.title,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.more_horiz)
              ],
            ),
            // quill.QuillEditor.basic(

            //   controller: widget.controller,
            //   configurations: const quill.QuillEditorConfigurations(

            //     checkBoxReadOnly: true,

            //   ),
            // ),
            Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
                style: const TextStyle(fontSize: 12),
                widget.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.date),
                widget.isPinned
                    ? const Icon(
                        Icons.push_pin,
                        size: 16,
                      )
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
