

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Usermodel> _data = [];
  List<Usermodel> _allUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
              onChanged: (value) {
                // Filter the list based on the search input
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
                  hintText: "Search...")),
          bottom: AppBar(
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              title: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Icon(Icons.photo, color: Appcolors.grey),
                      Gap(3.w),
                      Text("Photos", style: AppTextTheme.fs14Normal())
                    ]),
                    Row(children: [
                      Icon(Icons.videocam, color: Appcolors.grey),
                      Gap(3.w),
                      Text("Videos", style: AppTextTheme.fs14Normal())
                    ]),
                    Row(children: [
                      Icon(Icons.link, color: Appcolors.grey),
                      Gap(3.w),
                      Text("Links", style: AppTextTheme.fs14Normal())
                    ]),
                  ],
                ),
                Gap(10.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        Icon(Icons.gif_box_outlined, color: Appcolors.grey),
                        Gap(3.w),
                        Text("GIFs", style: AppTextTheme.fs14Normal())
                      ]),
                      Row(children: [
                        Icon(Icons.headphones, color: Appcolors.grey),
                        Gap(3.w),
                        Text("Audio", style: AppTextTheme.fs14Normal())
                      ]),
                      Row(children: [
                        Icon(Icons.document_scanner_rounded,
                            color: Appcolors.grey),
                        Gap(3.w),
                        Text("Documents", style: AppTextTheme.fs14Normal())
                      ])
                    ]),
              ]))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User")
                  .where("username",
                      isNotEqualTo: UserController().user.name)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    // Parse user data from Firebase response
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_data[index].name.toString()),
                                Text("5:27 am",
                                    style: AppTextTheme.fs12Normal()
                                        .copyWith(color: Appcolors.Lightgreen))
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
                    return Text("No friends found");
                  }
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
    );
  }
}
