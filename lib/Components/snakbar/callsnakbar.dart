import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/model/Callmodel/callcontroller.dart';
import 'package:whatsapp/model/Callmodel/callmodel.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/screen/Home/chat/callallpage/callpage.dart';
import 'package:whatsapp/screen/Home/chat/callallpage/videocall.dart';

Future Audiocallsnakbar(Callmodel calldata) async {
  Get.snackbar(
    calldata.callername!,
    "Incoming Audio Call",
    mainButton: TextButton(
        onPressed: () {
          Callcontroller().endcall(calldata);
          Get.back();
        },
        child: Text("End")),
    duration: Duration(days: 1),
    isDismissible: false,
    icon: Image.asset(calldata.callerimg!),
    onTap: (snack) {
      Get.back();
      Callpage(
          target: Usermodel(
              id: calldata.calleruid,
              name: calldata.callername,
              image: calldata.callerimg,
              phoneno: calldata.callerphn));
    },
  );
}

Future Videocallsnakbar(Callmodel calldata) async {
  Get.snackbar(
    calldata.callername!,
    "Incoming Video Call",
    mainButton: TextButton(
        onPressed: () {
          Callcontroller().endcall(calldata);
          Get.back();
        }, 
        child: Text("End")),
    duration: Duration(days: 1),
    isDismissible: false,
    icon: Image.asset(calldata.callerimg!),
    onTap: (snack) {
      Get.back();
      Videocall(
          target: Usermodel(
              id: calldata.calleruid,
              name: calldata.callername,
              image: calldata.callerimg,
              phoneno: calldata.callerphn));
    },
  );
}
