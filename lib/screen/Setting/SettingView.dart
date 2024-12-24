import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/screen/auth/Login_view.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    final _usercontroller = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Gap(15),
                  ListTile(
                      onTap: () {
                        Get.toNamed(RouteName.Profileview);
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
                              imageUrl: _usercontroller.user.image.toString())),
                      title: Text(_usercontroller.user.name.toString(),
                          style: AppTextTheme.fs13semibold()),
                      subtitle: Text("Hey there! Iam using WhatsApp.",
                          style: AppTextTheme.fs12Normal(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.qr_code_2))),
                  Gap(10),
                  Divider(color: Appcolors.black),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: DataController.Profiledata.length,
                      itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            onpressed(index, context);
                          },
                          leading: Icon(
                              DataController.Profiledata[index]["icon"],
                              size: 25,
                              color: Appcolors.grey),
                          title: Text(
                              DataController.Profiledata[index]["title"],
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text(
                              DataController.Profiledata[index]["subtitle"],
                              style: AppTextTheme.fs12Normal())))
                ]),
                Column(children: [
                  Text("from",
                      style: AppTextTheme.fs12Normal()
                          .copyWith(color: Appcolors.grey)),
                  Gap(5),
                  Text("FACEBOOK", style: AppTextTheme.fs15Normal())
                ]),
                Gap(10)
              ]),
        ));
  }

  onpressed(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Get.toNamed(RouteName.AccountView);
      case 1:
        return Get.toNamed(RouteName.ProfileChatView);
      case 2:
        return Get.toNamed(RouteName.ProfileNotification);
      case 3:
        return Get.toNamed(RouteName.Storageanddata);
      case 4:
        return Get.toNamed(RouteName.HelpView);
      case 5:
        return Get.to(Loginview());

      default:
    }
  }
}
