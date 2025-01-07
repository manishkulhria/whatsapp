import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Exception/AppExceptions.dart';
import 'package:whatsapp/backend/repo/baseservices.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/screen/auth/Otpview.dart';


class AuthRepositry extends Authentication {
  static final _firebaseStorage = FirebaseStorage.instance;
  final store = FirebaseFirestore.instance;
  final UserController userController = Get.find<UserController>();
  Usermodel userdata = Usermodel();

  @override
  Future<Usermodel> signup({required Usermodel user}) async {
    try {
      String verificationId = '';
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: user.phoneno,
        verificationCompleted: (phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          Get.snackbar("Phone number", error.toString());
        },
        codeSent: (verificationIdReceived, forceResendingToken) {
          verificationId = verificationIdReceived;
          Get.to(() => OtpView(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (e) {},
      );

      return userdata;
    } on FirebaseAuthException catch (e) {
      print("----------------");
      print(e.toString());
      throw DefaultException(
          message: "Error during phone number verification: ${e.toString()}");
    } catch (e) {
      throw DefaultException(
          message: "An unknown error occurred: ${e.toString()}");
    }
  }
   Future<Usermodel> Login({required Usermodel user}) async {
    try {
      String verificationId = '';
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: user.phoneno,
        verificationCompleted: (phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          Get.snackbar("Phone number", error.toString());
        },
        codeSent: (verificationIdReceived, forceResendingToken) {
          verificationId = verificationIdReceived;
          Get.to(() => OtpView(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (e) {},
      );

      return userdata;
    } on FirebaseAuthException catch (e) {
      print("----------------");
      print(e.toString());
      throw DefaultException(
          message: "Error during phone number verification: ${e.toString()}");
    } catch (e) {
      throw DefaultException(
          message: "An unknown error occurred: ${e.toString()}");
    }
  }

  static Future<String?> uploadImageToFirebase(File image) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      throw Exception('User is not authenticated');
    }
    try {
      final storageRef = await _firebaseStorage
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = await storageRef.putFile(image);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
