import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/Home/chat/widget/usertile.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Usermodel> list = [];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Appcolors.darkgreen,
            onPressed: () {
              Get.toNamed( RouteName.Selectcontact);
            },
            child: Icon(Icons.comment, color: Appcolors.white)),
        body: SingleChildScrollView(
            child: Column(children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User")
                  .where("phoneno", isNotEqualTo: Apis.user.phoneNumber)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    QuerySnapshot _data = snapshot.data as QuerySnapshot;
                    if (_data.docs.length > 0) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data?.docs;
                            list = data
                                    ?.map((e) => Usermodel.fromJson(
                                        FirebaseResponseModel.fromResponse(e)))
                                    .toList() ??
                                [];
                            return Usertile(user: list[index]);
                          });
                    } else {
                      return Text("No friends");
                    }
                  } else if (snapshot.hasError) {
                    return Text("Error! An error occured");
                  } else {
                    return Text("No friends");
                  }
                } else {
                  return Center(
                      child: SizedBox(
                          height: 18, child: CircularProgressIndicator()));
                }
              })
        ])));
  }
}
