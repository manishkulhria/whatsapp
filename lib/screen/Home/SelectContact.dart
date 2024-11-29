import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class Selectcontact extends StatelessWidget {
  const Selectcontact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.darkgreen,
        foregroundColor: Appcolors.white,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Select contact", style: AppTextTheme.fs18Normal()),
          Text("25 contacts", style: AppTextTheme.fs14Normal())
        ]),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
              enabled: true,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Text("Invite a friend",
                            style: AppTextTheme.fs14Normal())),
                    PopupMenuItem(
                        child:
                            Text("Contacts", style: AppTextTheme.fs14Normal())),
                    PopupMenuItem(
                        child:
                            Text("Refresh", style: AppTextTheme.fs14Normal())),
                    PopupMenuItem(
                        child: Text("Help", style: AppTextTheme.fs14Normal()))
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
                title: Text("New contact", style: AppTextTheme.fs15Normal())),
            Gap(10.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: DataController.Allcontacts.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.MessageView);
                },
                leading:
                    Image.asset(DataController.Allcontacts[index]["image"]),
                title: Text(DataController.Allcontacts[index]["title"],
                    style: AppTextTheme.fs13semibold()),
                subtitle: Text(
                  DataController.Allcontacts[index]["subtitle"],
                  style:
                      AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
