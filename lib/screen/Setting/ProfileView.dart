import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Gap(10),
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
                        : Image.file(
                            imageFile!,
                            width: 150,
                            fit: BoxFit.cover,
                          ))),
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
          Gap(40),
          ListTile(
            leading: Icon(Icons.person, color: Appcolors.grey),
            title: Text("Name", style: AppTextTheme.fs11Normal()),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Susi Franklin", style: AppTextTheme.fs13semibold()),
              Text(
                  "This is not your username or pin. This name will be visible to your whatsApp contacts.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.fs11Normal())
            ]),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Appcolors.darkgreen,
                )),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.remove_circle_outline, color: Appcolors.grey),
              title: Text("About", style: AppTextTheme.fs11Normal()),
              subtitle: Text("Hey there! I am using whatsApp.",
                  style: AppTextTheme.fs13semibold()),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Appcolors.darkgreen))),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone, color: Appcolors.grey),
            title: Text("Phone", style: AppTextTheme.fs11Normal()),
            subtitle:
                Text("+91 1234567890", style: AppTextTheme.fs13semibold()),
          )
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
      Navigator.of(context).pop();
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
      Navigator.of(context).pop();
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
                  icon: Icon(
                    Icons.camera,
                    color: Appcolors.darkgreen,
                  ),
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
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.cancel, color: Appcolors.darkgreen),
                  label: Text("Cancel",
                      style: AppTextTheme.fs13semibold()
                          .copyWith(color: Appcolors.darkgreen)))
            ])));
  }
}
