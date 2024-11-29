import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
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
                    ])
              ]))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: DataController.Chatdata.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.MessageView);
                },
                leading: Image.asset(DataController.Chatdata[index]["image"]),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DataController.Chatdata[index]["title"],
                        style: AppTextTheme.fs13Normal(),
                      ),
                      Text(DataController.Chatdata[index]["time"],
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey))
                    ]),
                subtitle: Text(
                  DataController.Chatdata[index]["subtitle"],
                  style:
                      AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
