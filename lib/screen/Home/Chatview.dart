import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/Home/MessageView.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Usermodel> list = [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Appcolors.darkgreen,
          onPressed: () {
            Navigator.pushNamed(context, RouteName.Selectcontact);
          },
          child: Icon(Icons.comment, color: Appcolors.white)),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            return ListTile(
                                onTap: () {
                                  Get.to(MessageView(model: list[index]));
                                },
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                color: Appcolors.Red,
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        imageUrl:
                                            list[index].image!.toString())),
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(list[index].name.toString(),
                                          style: AppTextTheme.fs13Normal()),
                                      Text("5:27 am",
                                          style: AppTextTheme.fs12Normal()
                                              .copyWith(
                                                  color: Appcolors.Lightgreen))
                                    ]),
                                subtitle: Text(
                                    DataController.Chatdata[index]["subtitle"],
                                    style: AppTextTheme.fs12Normal()
                                        .copyWith(color: Appcolors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis));
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
                        height: 18, child: CircularProgressIndicator()),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
