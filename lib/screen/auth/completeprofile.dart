import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class Completeprofile extends StatefulWidget {
  const Completeprofile({super.key});

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  TextEditingController _name = TextEditingController();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Profile Info",
                style: AppTextTheme.fs20Normal()
                    .copyWith(color: Appcolors.darkgreen)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
            ]),
        body: SingleChildScrollView(
            child: Column(children: [
          Text("Please provide your name and an profile photo"),
          Center(
              child: Stack(alignment: Alignment(0.9, 1), children: [
            Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: imageFile == null
                        ? Image.asset(AppImage.Profileimg,
                            width: 150, fit: BoxFit.cover)
                        : Image.file(imageFile!,
                            width: 150, fit: BoxFit.cover))),
            IconButton(
                style:
                    TextButton.styleFrom(backgroundColor: Appcolors.darkgreen),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => imagePickerbottomsheet());
                },
                icon: Icon(Icons.camera_alt, color: Appcolors.white, size: 20))
          ])),
          TextField(
              controller: _name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Appcolors.darkgreen)),
                  suffix: Icon(Icons.emoji_emotions_outlined))),
          CommonBtn(
              minimumSize: false,
              title: "Next",
              onPressed: () async {
                try {
                  Apis.createUser(_name.text.toString(),imageFile).then(
                    (value) => Get.toNamed(RouteName.HomePage),
                  );
                } catch (e) {
                  print(e.toString());
                }
              })  
        ])));
  }

  getImageFormGallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Get.back();
    }
  }

  getImageFormCamra() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Get.back();
    }
  }

  imagePickerbottomsheet() {
    return ClipRect(
        child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: Column(children: [
              Gap(15.h),
              Text("Image Picker", style: AppTextTheme.fs16Bold()),
              Gap(10.h),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      getImageFormCamra();
                    });
                  },
                  icon: Icon(Icons.camera, color: Appcolors.darkgreen),
                  label: Text("Camera",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen))),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      getImageFormGallery();
                    });
                  },
                  icon: Icon(Icons.image, color: Appcolors.darkgreen),
                  label: Text("Gallery",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen))),
              ElevatedButton.icon(
                  onPressed: () {
                     Get.back();
                  },
                  icon: Icon(Icons.cancel, color: Appcolors.darkgreen),
                  label: Text("Cancel",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen)))
            ])));
  }
}
