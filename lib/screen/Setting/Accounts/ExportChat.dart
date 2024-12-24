import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class ExportChatView extends StatelessWidget {
  const ExportChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.darkgreen,
          foregroundColor: Appcolors.white,
          title: Text("Choose chat"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10.h),
                      Text("Recent chats",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey)),
                      Gap(10.h),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: DataController.Chatdata.length,
                          itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Get.toNamed( RouteName.MessageView);
                              },
                              leading: Image.asset(
                                  DataController.Chatdata[index]["image"]),
                              title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        DataController.Chatdata[index]["title"],
                                        style: AppTextTheme.fs13Normal()),
                                    Text("MOBILE",
                                        style: AppTextTheme.fs12Normal()
                                            .copyWith(color: Appcolors.grey))
                                  ]),
                              subtitle: Text(
                                  DataController.Chatdata[index]["subtitle"],
                                  style: AppTextTheme.fs12Normal()
                                      .copyWith(color: Appcolors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis))),
                      Gap(10),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: DataController.Allcontacts.length,
                          itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Get.toNamed( RouteName.MessageView);
                              },
                              leading: Image.asset(
                                  DataController.Allcontacts[index]["image"]),
                              title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        DataController.Allcontacts[index]
                                            ["title"],
                                        style: AppTextTheme.fs13semibold()),
                                    Text("MOBILE",
                                        style: AppTextTheme.fs12Normal()
                                            .copyWith(color: Appcolors.grey))
                                  ]),
                              subtitle: Text(
                                DataController.Allcontacts[index]["subtitle"],
                                style: AppTextTheme.fs12Normal()
                                    .copyWith(color: Appcolors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )))
                    ]))));
  }
}
