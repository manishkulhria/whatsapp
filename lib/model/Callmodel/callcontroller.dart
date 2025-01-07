import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Components/snakbar/callsnakbar.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/model/Callmodel/callmodel.dart';
import 'package:whatsapp/model/authmodel.dart';

class Callcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void onInit() {
    super.onInit();
    getcallnotification().listen(
      (List<Callmodel> call) {
        if (call.isNotEmpty) {
          var calldata = call[0];
          if (calldata.type == calltype.AUDIO) {
            Audiocallsnakbar(calldata);
          } else if (calldata.type == calltype.VIDEO) ;
          Videocallsnakbar(calldata);
        }
      },
    );
  }

  Future callactive(Usermodel receiver, Usermodel caller, calltype type) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final nowtime = DateTime.now().millisecondsSinceEpoch.toString();
    final newcall = Callmodel(
        id: id,
        callername: caller.name,
        callerimg: caller.image,
        callerphn: caller.phoneno,
        calleruid: caller.id,
        receivername: receiver.name,
        receiverimg: receiver.image,
        receiverphn: receiver.phoneno,
        receiveruid: receiver.id,
        status: "dialing",
        type: type.toString(),
        time: nowtime);

    try {
      await db
          .collection("notification")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(newcall.toMap());
      await Apis.userDocumentRef(_auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(newcall.toMap());
      await Apis.userDocumentRef(receiver.id!)
          .collection("calls")
          .doc(id)
          .set(newcall.toMap());

      Future.delayed(Duration(seconds: 20), () {
        endcall(newcall);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // --getcallnotification-

  Stream<List<Callmodel>> getcallnotification() {
    return db
        .collection("notification")
        .doc(_auth.currentUser!.uid)
        .collection("calls")
        .snapshots()
        .map(
          (e) => e.docs
              .map((element) => Callmodel.fromJson(element.data()))
              .toList(),
        );
  }

  Future endcall(Callmodel call) async {
    try {
      await db
          .collection("notification")
          .doc(call.receiveruid)
          .collection("call")
          .doc(call.id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // ----CALL HISTORY

  Stream<List<Callmodel>> Getcallhistory() {
    print(Apis.userDocumentRef(_auth.currentUser!.uid));
    return Apis.userDocumentRef(_auth.currentUser!.uid)
        .collection("calls")
        // .orderBy("timestamp", descending: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Callmodel.fromJson(e.data())).toList());
  }
}
