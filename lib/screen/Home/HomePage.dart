import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Components/dialog.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/screen/Home/Chatview.dart';
import 'package:whatsapp/screen/Home/CallView.dart';
import 'package:whatsapp/screen/Home/StatusView.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int tabbarindex = 0;
  late TabController tabController =
      TabController(length: 4, vsync: this, initialIndex: tabbarindex);

  @override
  Widget build(BuildContext context) {

    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          if (tabbarindex != 0) {
            setState(() {
              tabbarindex = 0;
            });
          } else {
            Get.dialog(EixtAppDailog(), barrierDismissible: false);
            ;
          }
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
                foregroundColor: Appcolors.white,
                backgroundColor: Appcolors.darkgreen,
                automaticallyImplyLeading: false,
                title: Text("WhatsApp"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.SearchView);
                      },
                      icon: Icon(Icons.search)),
                  PopupMenuButton(
                      enabled: true,
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                onTap: () {},
                                child: Text("New group",
                                    style: AppTextTheme.fs13Normal())),
                            PopupMenuItem(
                                onTap: () {},
                                child: Text("New broadcast",
                                    style: AppTextTheme.fs13Normal())),
                            PopupMenuItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.LinkeddeviceView);
                                },
                                child: Text("Linked devices",
                                    style: AppTextTheme.fs13Normal())),
                            PopupMenuItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.StarrehView);
                                },
                                child: Text("Starred messages",
                                    style: AppTextTheme.fs13Normal())),
                            PopupMenuItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.PaymentView);
                                },
                                child: Text("Payments",
                                    style: AppTextTheme.fs13Normal())),
                            PopupMenuItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.SettingView);
                                },
                                child: Text("Settings",
                                    style: AppTextTheme.fs13Normal()))
                          ])
                ],
                bottom: TabBar(
                    indicatorColor: Appcolors.white,
                    controller: tabController,
                    labelColor: Appcolors.white,
                    unselectedLabelColor: Appcolors.white,
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStatePropertyAll(Appcolors.darkgreen),
                    tabs: [
                      Tab(child: Icon(Icons.camera_alt)),
                      Tab(child: Text("CHATS")),
                      Tab(child: Text("STATUS•")),
                      Tab(child: Text("CALLS"))
                    ])),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TabBarView(controller: tabController, children: [
                  Text("kjiuhy"),
                  ChatView(),
                  StatusView(),
                  CallView()
                ]))));
  }
}
