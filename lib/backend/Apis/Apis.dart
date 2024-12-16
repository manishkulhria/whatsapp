import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/repo/auth_repositry.dart';
import 'package:whatsapp/backend/repo/sharedPerf.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/model/messagemodel.dart';

class Apis {
  static final _firestore = FirebaseFirestore.instance;

  // Collection References
  static CollectionReference userCollectionRef = _firestore.collection("User");

  // Document References
  static DocumentReference userDocumentRef(String id) =>
      userCollectionRef.doc(id);
//  Firebase auth
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;

  static Future<bool> userExists() async {
    return (await userDocumentRef(user.uid).get()).exists;
  }

//  create user
  static Future<void> createUser(String name, File? imgfile) async {
    final UserController userController = Get.find<UserController>();

    try {
      final chatuser = Usermodel(
          image: await AuthRepositry.uploadImageToFirebase(imgfile!),
          phoneno: user.phoneNumber.toString(),
          id: user.uid,
          name: name.toString());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        userController.setUser(chatuser);
        SpData.setprafdata(SpData.userid, chatuser.id!);
      });

      return (await userDocumentRef(user.uid).set(chatuser.toMap()));
    } catch (e) {
      print(e.toString());
    }
  }
  // -----------------

  static Future<void> Updateuser(String name, File? imgfile) async {
    final UserController userController = Get.find<UserController>();

    try {
      final updateuser = Usermodel(
          image: await AuthRepositry.uploadImageToFirebase(imgfile!) ??
              userController.user.image,
          phoneno: user.phoneNumber.toString(),
          id: user.uid,
          name: name.toString());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        userController.setUser(updateuser);
        SpData.setprafdata(SpData.userid, updateuser.id!);
      });

      return (await userDocumentRef(user.uid).update(updateuser.toMap()));
    } catch (e) {
      print(e.toString());
    }
  }
  // -------------------------------

  static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

// -------

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      Usermodel user) {
    return _firestore
        .collection('chats/${getConversationID(user.id!)}/messages/')
        .snapshots();
  }

  // ===
  static Future<void> sendMessage(
      Usermodel chatUser, String msg, MessageType type) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = _firestore
        .collection('chats/${getConversationID(chatUser.id!)}/messages/');
    //message to send
    final Message message = Message(
        toid: chatUser.id,
        msg: msg,
        read: '',
        messageType: type,
        fromid: user.uid,
        sentAt: time);

    await ref.doc(time).set(message.toMap());
  }

  // --------------update read msg-

  static Future Updatereadmsg(Message msg) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    _firestore
        .collection('chats/${getConversationID(msg.fromid!)}/messages/')
        .doc(msg.sentAt)
        .update({"read": time});
  }

  // --------------send chat image--
  static Future sendchatimg(Usermodel model, File file) async {
    final ext = file.path.split(".").last;

    final ref = FirebaseStorage.instance.ref().child(
        "images/${getConversationID(model.id!)}/${DateTime.now().millisecondsSinceEpoch}.$ext");
        await ref.putFile(file,SettableMetadata(contentType: "image/.$ext"));
        final downloadurl= await ref.getDownloadURL();
        await sendMessage(model, downloadurl, MessageType.Image);
  }
}
