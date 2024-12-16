import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/screen/Home/MessageView.dart';

class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  bool _issearch = false;
  List<Usermodel> _data = [];
  List<Usermodel> _allUsers = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // ignore: deprecated_member_use
      child: WillPopScope(
        onWillPop: () {
          if (_issearch) {
            setState(() {
              _issearch = !_issearch;
            });

            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors.darkgreen,
            foregroundColor: Appcolors.white,
            title: _issearch == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Select contact",
                            style: AppTextTheme.fs18Normal()),
                        Text("25 contacts", style: AppTextTheme.fs14Normal())
                      ])
                : TextField(
                    onChanged: (value) {
                      setState(() {
                        _data = _allUsers.where((element) {
                          return element.name!
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        }).toList();
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Search name",
                        hintStyle: AppTextTheme.fs13Normal().copyWith(
                            color: Appcolors.white.withOpacity(0.8)))),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _issearch = !_issearch;
                    });
                  },
                  icon: Icon(_issearch
                      ? CupertinoIcons.clear_circled_solid
                      : Icons.search)),
              PopupMenuButton(
                  enabled: true,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: Text("Invite a friend",
                                style: AppTextTheme.fs14Normal())),
                        PopupMenuItem(
                            child: Text("Contacts",
                                style: AppTextTheme.fs14Normal())),
                        PopupMenuItem(
                            child: Text("Refresh",
                                style: AppTextTheme.fs14Normal())),
                        PopupMenuItem(
                            child:
                                Text("Help", style: AppTextTheme.fs14Normal()))
                      ])
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    leading: IconButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Appcolors.darkgreen),
                        onPressed: () {},
                        icon: Icon(Icons.people)),
                    title: Text("New group", style: AppTextTheme.fs15Normal())),
                ListTile(
                    leading: IconButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Appcolors.darkgreen),
                        onPressed: () {},
                        icon: Icon(Icons.person_add)),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
                    title:
                        Text("New contact", style: AppTextTheme.fs15Normal())),
                Gap(10.h),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("User")
                      .where("username",
                          isNotEqualTo: UserController().user.name)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final data = snapshot.data?.docs;
                      _allUsers = data
                              ?.map((e) => Usermodel.fromJson(
                                  FirebaseResponseModel.fromResponse(e)))
                              .toList() ??
                          [];

                      // all data handler
                      _data = _data.isEmpty ? _allUsers : _data;

                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Get.to(MessageView(model: _data[index]));
                              },
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              color: Appcolors.Red,
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  imageUrl: _data[index].image.toString(),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_data[index].name.toString()),
                                  Text("5:27 am",
                                      style: AppTextTheme.fs12Normal().copyWith(
                                          color: Appcolors.Lightgreen))
                                ],
                              ),
                              subtitle: Text(
                                  DataController.Chatdata[index]["subtitle"],
                                  style: AppTextTheme.fs12Normal()
                                      .copyWith(color: Appcolors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("Error! An error occurred");
                    } else {
                      return Center(
                        child: SizedBox(
                            height: 18, child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
