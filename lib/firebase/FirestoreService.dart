import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_quill/flutter_quill.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUserDataByEmail(String email) {
    return FirebaseFirestore.instance
        .collection('Users') // The name of your collection
        .where('email', isEqualTo: email)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> addUserToDatabase(String uid, email, username) async {
    await firestore
        .collection("Users")
        .doc(uid)
        .set({'uid': uid, "email": email, "username": username});
  }

  Future<void> saveNoteToFirestore(
      QuillController controller, bool pinned, String title) async {

    // Get the Quill document as JSON
    var jsonData = controller.document.toDelta().toJson();

    String uid = auth.currentUser!.uid;
        String noteId = uid + DateTime.now().toString();
    // Store the note with a unique ID
    await firestore.collection("Notes").doc(uid).collection("notes").doc(noteId).set({
      "noteId":noteId,
      'title': title,
      'content': jsonData, // Save the document as JSON
      'timestamp': FieldValue.serverTimestamp(),
      'pinned': pinned,
    });
  }

  Future<void> updateNote(QuillController controller,String noteId,String title,bool pinned) async{
    var jsonData = controller.document.toDelta().toJson();
    String uid = auth.currentUser!.uid;
    await firestore.collection("Notes").doc(uid).collection("notes").doc(noteId).update({
      'title': title,
      'content': jsonData, // Save the document as JSON
      'timestamp': FieldValue.serverTimestamp(),
      'pinned': pinned,
    });
  }

  Stream<List<Map<String, dynamic>>> getNotesBasedOnUser() {
    String uid = auth.currentUser!.uid;
    return firestore
        .collection('Notes')
        .doc(uid)
        .collection('notes')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final todo = doc.data();
        return todo;
      }).toList();
    });
  }
  Stream<List<Map<String, dynamic>>> getPinnedNotesBasedOnUser() {
    String uid = auth.currentUser!.uid;
    return firestore
        .collection('Notes')
        .doc(uid)
        .collection('notes')
        .where("pinned",isEqualTo: true)
        .snapshots()
        
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final todo = doc.data();
        return todo;
      }).toList();
    });
  }


}
