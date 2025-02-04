import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Appcolors.darkgreen,
            foregroundColor: Appcolors.white,
            title: Text("Account")),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: DataController.Accountdata.length,
                itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      accountonpressed(index, context);
                    },
                    leading: Icon(DataController.Accountdata[index]["icon"],
                        color: Appcolors.grey),
                    title: Text(DataController.Accountdata[index]["title"],
                        style: AppTextTheme.fs13semibold())))
          ]),
        )));
  }

  accountonpressed(int index, BuildContext context) {
    switch (index) {
      // case 0:
      //   return Get.toNamed( RouteName.SecurityView);
      case 1:
        return Get.toNamed( RouteName.SecurityView);
      case 2:
        return Get.toNamed( RouteName.twostepVerfication);
      case 3:
        return Get.toNamed( RouteName.changepassword);
      case 4:
        return Get.toNamed( RouteName.requestaccount);
      case 5:
        return Get.toNamed( RouteName.deleteaccount);

      default:
    }
  }
}
