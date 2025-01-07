import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'package:whatsapp/model/authmodel.dart';

class Callpage extends StatelessWidget {

  Usermodel target;
  Callpage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    final _usercontroller = Get.find<UserController>();
    final callid = Apis.getConversationID(target.id!);
    return ZegoUIKitPrebuiltCall(
        appID: 540874264,
        appSign:
            'd519a7d6ec3bf98dd8163fab009b8c4fd77bce22889cfd412d51e9bfa7ea8e64',
        userID: _usercontroller.user.id!,
        userName: _usercontroller.user.name!,
        callID: callid,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall());
  }
}

