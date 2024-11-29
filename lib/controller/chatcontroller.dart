import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsapp/model/chatmodel.dart';

class Chatcontroller extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future sendchat(Chatmodel data) async {
    try {
      if (_auth.currentUser != null) {
        await _firestore.collection("chat").doc().set(data.tomap());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
