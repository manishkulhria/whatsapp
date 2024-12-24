import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/Home/statusadd.dart/storyview.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final _usercontroller = Get.find<UserController>();

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Appcolors.darkgreen,
              onPressed: () {
                Get.toNamed( RouteName.Selectcontact);
              },
              child: Icon(
                Icons.edit,
                color: Appcolors.white,
              )),
          Gap(15.h),
          FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Appcolors.darkgreen,
              onPressed: () {
                Get.toNamed( RouteName.Selectcontact);
              },
              child: Icon(
                Icons.camera_alt,
                color: Appcolors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Get.to(Storyview());
              },
              leading: Stack(alignment: Alignment(1.2, 1.3), children: [
                ClipRRect(
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageUrl: _usercontroller.user.image.toString())),
                GestureDetector(
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolors.darkgreen,
                            border: Border.all(color: Appcolors.black)),
                        child: Icon(Icons.add, color: Appcolors.white)))
              ]),
              title: Text("My status"),
              subtitle: Text("Tap to add status update"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Recent updates", style: AppTextTheme.fs13Normal()),
            ),
            Gap(5),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: DataController.Chatdata.length,
                itemBuilder: (context, index) {
                  // Create a unique tag for each hero, for example using index
                  String heroTag =
                      "status_hero_tag_$index"; // Ensure each Hero tag is unique

                  return ListTile(
                      leading: Hero(
                        tag: heroTag, // Set the unique tag here
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Appcolors.darkgreen),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                              DataController.Chatdata[index]["image"]),
                        ),
                      ),
                      title: Text(
                        DataController.Chatdata[index]["title"],
                        style: AppTextTheme.fs13semibold(),
                      ),
                      subtitle: Text(DataController.Chatdata[index]["time"]));
                }),
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Viewed updates", style: AppTextTheme.fs13Normal()),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down_rounded))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
