import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "package:flutter_quill/flutter_quill.dart" as quill;
import 'package:notes_app_flutter/constants/ColorsToUse.dart';
import 'package:notes_app_flutter/firebase/FirestoreService.dart';
import 'package:notes_app_flutter/utilities/DialogBox.dart';

class CreateNotesScreen extends StatefulWidget {
  final quill.QuillController? controller;
  final bool? pinned;
  final String? title;
  const CreateNotesScreen(
      {super.key, this.controller, this.title, this.pinned});

  @override
  State<CreateNotesScreen> createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  final FirestoreService service = FirestoreService();
  final titleController = TextEditingController();

  final _controller = quill.QuillController.basic();

  String currDate =
      DateFormat("MMM dd , EEE , yyyy  hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    bool isPinned = widget.pinned ?? false;

    if (widget.title != null) {
      setState(() {
        titleController.text = widget.title!;
      });
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isPinned = !isPinned;
                });
              },
              icon: Icon(
                Icons.push_pin,
                color: isPinned ? ColorsToUse().primaryColor : Colors.black,
              )),
          IconButton(
              onPressed: () async {
                DialogBox().showLoadingDialog(context, "LLoading");
                await service.saveNoteToFirestore(
                    _controller, isPinned, titleController.text);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
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
                TextField(
                  controller: titleController,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
                Expanded(
                  child: quill.QuillEditor.basic(
                    controller: widget.controller ?? _controller,
                    configurations: const quill.QuillEditorConfigurations(
                      placeholder: "Start Typing...",
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
              borderRadius: BorderRadius.circular(15),
            ),
            child: quill.QuillToolbar.simple(
                configurations: quill.QuillSimpleToolbarConfigurations(
                  showColorButton: false,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  multiRowsDisplay: false,
                  showBoldButton: true,
                  showItalicButton: true,
                  showUndo: true,
                  showUnderLineButton: true,
                  showRedo: true,
                  showStrikeThrough: false,
                  showListBullets: false,
                  showFontFamily: false,
                  showFontSize: false,
                  showListNumbers: false,
                  showListCheck: false,
                  showCodeBlock: false,
                  showHeaderStyle: false,
                  showIndent: false,
                  showLink: false,
                  showAlignmentButtons: false,
                  showDirection: false,
                  showInlineCode: false,
                  showQuote: false,
                  showDividers: false,
                ),
                controller: widget.controller ?? _controller),
          ),
        )
      ]),
    );
  }
}
