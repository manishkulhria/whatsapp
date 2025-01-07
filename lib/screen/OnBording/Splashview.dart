import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/backend/repo/sharedPerf.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';
import 'package:whatsapp/controller/Theme/themecontroller.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  int index1 = 0;
  int index2 = 0;
  @override
  void initState() {
    super.initState();
    splash();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  User get user => auth.currentUser!;
  splash() async {
    await Future.delayed(Duration(seconds: 3), () => index1 = 1);
    setState(() {});
    await Future.delayed(Duration(seconds: 2), () => index2 = 2);
    setState(() {});
    Future.delayed(Duration(seconds: 3), () => relogin());
  }

  Future relogin() async {
    final _controller = Get.find<UserController>();
    final id = SpData.getprafdata(SpData.userid);

    if (id.isNotEmpty) {
      try {
        final db = await Apis.userDocumentRef(id).get();
        if (db.exists) {
          final data =
              Usermodel.fromJson(FirebaseResponseModel.fromResponse(db));
          _controller.setUser(data);
          Get.toNamed(RouteName.HomePage);
        } else {
          print("User not found");
          Get.offNamed(RouteName.Loginview);
        }
      } catch (e) {
        print("Relogin Error: ${e.toString()}");
        Get.offNamed(RouteName.Loginview);
      }
    } else {
      Get.offNamed(RouteName.Loginview);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<Themecontroller>();

    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Image.asset(theme.isdarkmode() ? AppImage.splashblack : AppImage.splash,
          width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Image.asset(AppImage.whatsapplogo, fit: BoxFit.cover),
                      index1 == 1
                          ? Text("WhatsApp", style: AppTextTheme.fs35Normal())
                          : SizedBox()
                    ],
                  ),
                ),
                index2 == 2
                    ? Column(
                        children: [
                          CircularProgressIndicator(color: Appcolors.darkgreen),
                          Text(
                            "Loading...",
                            style: AppTextTheme.fs15Normal()
                                .copyWith(color: Appcolors.Lightgreen),
                          )
                        ],
                      )
                    : index1 == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                Text(
                                  "from",
                                  style: AppTextTheme.fs12Normal()
                                      .copyWith(color: Appcolors.grey),
                                ),
                                Gap(5),
                                Text("FACEBOOK",
                                    style: AppTextTheme.fs15Normal())
                              ])
                        : SizedBox()
              ]))
    ]));
  }
}
